Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC0615B22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 04:48:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oq4jl-0001fk-IV;
	Wed, 02 Nov 2022 03:48:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oq4jk-0001fc-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tRLwY3E0qzFtTcoXJPe/iUoVaVKJzqHPA2RCKxvUh4=; b=H5CddWOtHYWEySRalRFILL+ATt
 BNP+wNkj0EXZCm5u+uuxqVe3Sud/IB7KA6VwMngblnihfaBiVLXKu9c6EhYjv3TBKDwexU56TRrhL
 DnjDHOJAGSUF/r3TrkQj2gus8bsMQOSXQ9Y6GHAXX8gkXD0baXcQI2UdWtinKFi8VYOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5tRLwY3E0qzFtTcoXJPe/iUoVaVKJzqHPA2RCKxvUh4=; b=Qp7jPxjg290lxVDXTln8/R2Wpm
 Kyp844t1ZtUbUGiABz+oa/rX3b9j13+V2wPi4C1GLvT4a1ErPshhwmct8mulzx9gHKzyFVwmzuMJq
 e0xP4D0aH2W8w41vW/a3f34O8PaKa/nusKfcZ7T6iilldiu3wMqG27wSO10BaIEZ1fBM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oq4jj-008zl6-P7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:48:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C2FE617D4;
 Wed,  2 Nov 2022 03:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0176C433D7;
 Wed,  2 Nov 2022 03:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667360887;
 bh=DVsfDqSlq0vXEg3sD1bl/7jqPk7Ia5VVtAhLAgbiM3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlyYLxTzx04JUEAtq0KE+9TlYmVVi/ytZDLmf71z6YD3V50qBGq475cz5LoWX3Liw
 YPcCUM7MpM9+1oXNkIHZsko0rGiB3qblcEVZ84pkAcw/ldPFl0Pv6aRnRKTFfOxwwm
 m5fPd7bSd5KAdfqS/CUMRI3r4CGS9OONih5tCaPA7wBzQ+x7JbnTnmcJgEZ2c8nYHZ
 aho7y/5K5GmNlGHmO7YWSOSa145CMqkTxnVFhDCYaN6uetccqAAcBpPdaVs/uwj6Bj
 cvFhn1nBDmcFDSSVmWNEH1IkSM9rEsclh4sbIR2AlSAcXPWk2/CfCzg+IYV7znj/jD
 FDp4iEJKp0iVw==
Date: Tue, 1 Nov 2022 20:48:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: fengnan chang <fengnanchang@gmail.com>
Message-ID: <Y2HodQZHpNupi+l9@sol.localdomain>
References: <20220608134852.476876-1-fengnanchang@gmail.com>
 <Y2HQftXirAxvab6M@sol.localdomain>
 <694663F8-701D-4318-94D0-A1F532DDF6F9@gmail.com>
 <Y2HhoBnocFff1WFB@sol.localdomain>
 <CALWNXx9-EtdXpGJONESQAQ9aOK9=Ggk9n0U+wxy-Wxq+sBcXkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALWNXx9-EtdXpGJONESQAQ9aOK9=Ggk9n0U+wxy-Wxq+sBcXkg@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 02, 2022 at 11:43:11AM +0800,
 fengnan chang wrote:
 > > > > What is the purpose of using PG_error here? > > > > > > In this
 version, 
 we set PG_error when compressed failed, so check PG_erro [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oq4jj-008zl6-P7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 02, 2022 at 11:43:11AM +0800, fengnan chang wrote:
> > > > What is the purpose of using PG_error here?
> > >
> > > In this version, we set PG_error when compressed failed, so check PG_error here.
> > > Maybe we can remove PG_error in later?
> > >
> >
> > Read I/O errors can be detected via PG_uptodate not being set.  There shouldn't
> > be any need for PG_error here.
> 
> Yeah, I get it now. Maybe we can remove PG_error in f2fs_verify_cluster too.
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d315c2de136f..13c0bfe45804 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1727,10 +1727,9 @@ static void __f2fs_decompress_end_io(struct
> decompress_io_ctx *dic, bool failed,
>                         continue;
> 
>                 /* PG_error was set if verity failed. */
> -               if (failed || PageError(rpage)) {
> -                       ClearPageUptodate(rpage);
> +               if (failed) {
>                         /* will re-read again later */
> -                       ClearPageError(rpage);
> +                       ClearPageUptodate(rpage);
>                 } else {
>                         SetPageUptodate(rpage);
>                 }
> @@ -1745,13 +1744,14 @@ static void f2fs_verify_cluster(struct
> work_struct *work)
>         struct decompress_io_ctx *dic =
>                 container_of(work, struct decompress_io_ctx, verity_work);
>         int i;
> +       bool failed = false;
> 
>         /* Verify the cluster's decompressed pages with fs-verity. */
>         for (i = 0; i < dic->cluster_size; i++) {
>                 struct page *rpage = dic->rpages[i];
> 
>                 if (rpage && !fsverity_verify_page(rpage))
> -                       SetPageError(rpage);
> +                       failed = true;
>         }

No, PG_error is still used to notify f2fs_finish_read_bio() and
__f2fs_decompress_end_io() of verity errors.  My patch
https://lore.kernel.org/r/20221028175807.55495-1-ebiggers@kernel.org changes
that.  Please leave that to my patch.  For your patch, please just don't add a
new use of PG_error, as it doesn't seem to be necessary.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
