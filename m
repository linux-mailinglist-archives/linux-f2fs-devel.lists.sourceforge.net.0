Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06561199A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 19:48:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooTT6-00023S-Kf;
	Fri, 28 Oct 2022 17:48:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ooTT3-00023L-14
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 17:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfYzwUFHh95MminZt7azgIF3xLxb2SkE4pWV5OBRj2Y=; b=leqVfTSa3/yaUclAXTvGQ6j9Q5
 x9qLhU/rRkvryDt7GcYcgy6JBldraKtDtU93HMDud0i0H2UTKWghL3Pd1UcCJ3Q0LUQ22GD7UE2JM
 3lTNFXWV8PEoSe2FAZF3j7CQZIEiQ8wn5r+BG4MXB22CT3IpCgnzDd0X8xb1mTsA+cNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DfYzwUFHh95MminZt7azgIF3xLxb2SkE4pWV5OBRj2Y=; b=lrhXEh/ROkZ02/Ax40blXZF5zl
 pSLMY9YW8lLND86IPxVTMrvqQ+MSONzqmf1VpENDorlM2ISDbRGJrQK6ilRjXsF3iAl8UBIUpIdKn
 sej8PVSgcAJlAQ+9zEV/8wE4ywFSyCFBJvpnVqDiARbFnSck5/sOV7N8DG1XupY4QlFg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooTT2-0001Ku-5S for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 17:48:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABFC6B8274E;
 Fri, 28 Oct 2022 17:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27028C433C1;
 Fri, 28 Oct 2022 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666979293;
 bh=oabnR2o9lQ1unf12v+PvLZJIhljZ0IVmBAbEiGR5Fwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MX5901LtgvRG6x+/4ThpmypVAz/UXtdTqOVXEfV/PvMB6mhcwPE+rE/+CJWwVaukA
 5D8Zdw0wj87UwsmmK+FDPOTU/egXys3KarUgA8YZ//tKzfahxWIh3LjaUe+m6GH+X8
 JYDwyt9shBgmFtQ9Tbd/lRLRVB99b0PxS3PMOfUNM6hNJ7PFhLK6B5ee0cfU32JC5n
 ZU92RAYPqAO28XWKH8gU06YPqFvs16DWc3zxSJqKbgL1KeHKmN4jzTPhYBGJ6G4ES5
 wOXfYfYQnqtavr43oUIcOXsYHRg40qnZVz8YZo76esQ21PrJV/73u5KxWBy53HalHn
 oEtiFpB2adKSA==
Date: Fri, 28 Oct 2022 10:48:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y1wV248oIKJX0kCy@sol.localdomain>
References: <20220815235052.86545-1-ebiggers@kernel.org>
 <20220815235052.86545-3-ebiggers@kernel.org>
 <47a86f09-3e9b-f841-4191-d750feda6642@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47a86f09-3e9b-f841-4191-d750feda6642@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 06, 2022 at 11:43:47PM +0800, Chao Yu wrote: >
 > @@ -1768,6 +1745,8 @@ static void f2fs_verify_cluster(struct work_struct
 *work) > > void f2fs_decompress_end_io(struct decompress_io_ctx *d [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooTT2-0001Ku-5S
Subject: Re: [f2fs-dev] [PATCH v2 2/2] fsverity: stop using PG_error to
 track error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 06, 2022 at 11:43:47PM +0800, Chao Yu wrote:
> > @@ -1768,6 +1745,8 @@ static void f2fs_verify_cluster(struct work_struct *work)
> >   void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> >   				bool in_task)
> >   {
> > +	int i;
> > +
> >   	if (!failed && dic->need_verity) {
> >   		/*
> >   		 * Note that to avoid deadlocks, the verity work can't be done
> > @@ -1777,9 +1756,28 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> >   		 */
> >   		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
> >   		fsverity_enqueue_verify_work(&dic->verity_work);
> > -	} else {
> > -		__f2fs_decompress_end_io(dic, failed, in_task);
> 
> Will it be possible to clean up __f2fs_decompress_end_io() and
> f2fs_verify_cluster(), they looks almost similar...
> 

I feel that it's simpler to keep them separate.

> > +static void f2fs_finish_read_bio(struct bio *bio, bool in_task,
> > +				 bool fail_compressed)
> 
> Not sure, fail_decompress or fail_decompression may looks more readable?
> 

I'll add a field 'bool decompression_attempted' to struct bio_post_read_ctx so
that this extra argument won't be needed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
