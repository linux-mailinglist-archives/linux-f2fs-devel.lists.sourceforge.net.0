Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E55869E0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 18:42:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf1TK-0007Do-9A;
	Tue, 27 Feb 2024 17:42:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rf1TI-0007Di-VA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YITWdPyEypuI6/fNIZlf0KLI4rAwjITUCKsQXfLLAnQ=; b=dFaub3LWKGzLrtc8atxhkzLjod
 fhNdYYjUpuxdK1UDE57hbzgiKlfVDxlUXINd72AS+5BLXp2AjiAfDmLEQCdVASthTJzlaj1GJmono
 bUP9lcZfcnCI34SWqtqsrEZKaeWy8gqSw13X8j3BWaS1QrvYJDvjA2XIBfGebR3Etrwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YITWdPyEypuI6/fNIZlf0KLI4rAwjITUCKsQXfLLAnQ=; b=eLEPPxriupfcv4VN/9DoqUw/d7
 hgVkRnO7nt8T3d9V4eQPDOLqU9y9SumojhNwpE/eGLdC4anf7PL4GOHlwkcP4x4v87mgteeHWsy8y
 tW6DEudHOFla8hV7c2zjGh+m/LCpW6lSdhzOItHuArT6R9K6BCSIYqTzl4bs4ChTHXQU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf1TF-0006xl-AJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D854CE18D7;
 Tue, 27 Feb 2024 17:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE62FC433C7;
 Tue, 27 Feb 2024 17:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709055732;
 bh=NlR8SVDrbbdna3Bt2gl2bPF72XhNMosFSQzI+VbYz+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HGtb9rusW+K5vUyPl4B0LG//mYO7wTj5662tDGqEbuZ5X/VGtP5d2wxmDwlRv0oK8
 eDQn77v19RIlvIumY+EkGy5/Hrmuow/9U/AMhVBiQRFaUJYakBssmpAmmO1HjsjKYv
 1L3JQzCbN00JD/Usfhm27etUXYaIRnUoiQmpMmAKGkl6DilesJKa9MbHTgF/nR08ua
 Ziyi2RW39QCk5yHSIvywxYehxaffjEVPNceLtpTqGGWAYoeZN526pgG2emO5Hddn2k
 HwnKm7S/aFSZ9f82MmPoAIdGFC+LjVBvts0WXfhRhbriWwlS26pRfCcBPXX2hdIZKu
 OCcKTFkc+QO0g==
Date: Tue, 27 Feb 2024 09:42:11 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <Zd4e8286KuPqLRaU@google.com>
References: <0dbca927-9037-4ccd-ac1e-98ade64a2a0b@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dbca927-9037-4ccd-ac1e-98ade64a2a0b@moroto.mountain>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/27, Dan Carpenter wrote: > Hello Jaegeuk Kim, > > The
 patch 9c1d3cd4ff8c: "f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and > SEGS_PER_SEC"
 from Feb 6, 2024 (linux-next), leads to the following > Smatc [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rf1TF-0006xl-AJ
Subject: Re: [f2fs-dev] [bug report] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC,
 and SEGS_PER_SEC
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/27, Dan Carpenter wrote:
> Hello Jaegeuk Kim,
> 
> The patch 9c1d3cd4ff8c: "f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and
> SEGS_PER_SEC" from Feb 6, 2024 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	fs/f2fs/gc.c:2092 update_fs_metadata()
> 	warn: cast after binop
> 
> fs/f2fs/gc.c
>     2089 static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>     2090 {
>     2091         int segs = secs * SEGS_PER_SEC(sbi);
> --> 2092         long long blks = (long long)(segs << sbi->log_blocks_per_seg);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Originally this was something like:
> 
> 	long long blks = (long long)segs << sbi->log_blocks_per_seg;

Thanks. I just reverted this line back to the original cast one.

> 
> So the cast seemed necessary to avoid an integer overflow.
> 
>     2093         long long user_block_count =
>     2094                                 le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
>     2095 
>     2096         SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>     2097         MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
> 
> regards,
> dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
