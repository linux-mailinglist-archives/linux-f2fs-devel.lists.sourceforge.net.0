Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC643BF592
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jul 2021 08:31:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1NZ1-0005pQ-If; Thu, 08 Jul 2021 06:31:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m1NYz-0005pI-17
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 06:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j52/ROX9Gb/BeSUh1PZ9TeK1/Md3wzYo3PdjZpmAs/M=; b=G/cXojUZNmOinRthRmrYmrqGfW
 rx/W1oGd85gbdMrw5B4mAJn9svH8Myuc7+Au0W8zXqccddlwk+V/a4FyVZSNwqh9Kq8/XGAmvo9Ta
 3t8JJDF15WNqZFRGuKFnnNZV9DlDK3exH93w9VY3CJH/drTh0D1+ojRdLjMEpw1y4jgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j52/ROX9Gb/BeSUh1PZ9TeK1/Md3wzYo3PdjZpmAs/M=; b=MglcxsvaT2s0uo/MGMmuNgI+Gk
 HjPGtoGaZq1/53kf/5rEG3w8eNwp8a7LiBD78LeCRca4B8X2hi8dCHACNGbllg/xuRlC7Yheejlxd
 w/YwGmxtWhsYLBtSAPA8RhgTgM/ajmRYUK3QKQkqiThuMaulRzkppYAvGG+/8VXrj2uY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1NYr-0006RF-G4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 06:31:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 503F861C94;
 Thu,  8 Jul 2021 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625725852;
 bh=IZHMEh0ka7AyTJo3yz8aEsCT6oO+pHxxPl9sFzzyH+k=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=LsXuiy7KrR2TH2n1I6A34iE2uNv2qXbYU6G2oFxGR/6oAtzR+95a7M8UKCCwULdVb
 1A8skr2PF8N3eKJk7zupGPfVFCJbeqMU2nauCv3ZRhm7AqrZBitRklp2gJupmMxuQE
 rRxc4oaSSckqWMRWTqLQEMdd6qKw1Vm/Ro8dkrXA23HQJqCgF99Ai7GkAaKAOP3+nv
 g/4FwmiS3OHashsd4tifej8al8Ck1GGP6Ror//5XE2LIJLdTtnIuZuvlDmqn7tlaF5
 y+NgsU5RYv83Cittu2Qnd3nmHxkQY2pDBTiGufONzLP52VAdio7wX+N739t1AK95h+
 5XC93suhXqVhA==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
 <20210621023939.1510591-2-jaegeuk@kernel.org> <YNNbk/AI2T6fkhLC@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <bb003f7c-eca0-92e2-613e-2c5d859b29ba@kernel.org>
Date: Thu, 8 Jul 2021 14:30:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNNbk/AI2T6fkhLC@google.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1NYr-0006RF-G4
Subject: Re: [f2fs-dev] [PATCH 2/4 v2] fsck|dump.f2fs: add -M to get file map
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/24 0:04, Jaegeuk Kim wrote:>   static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
>   {
>   	char buf[F2FS_BLKSIZE];
>   
> +	if (c.show_file_map) {
> +		if (c.show_file_map_max_offset < offset) {
> +			ASSERT(blkaddr == NULL_ADDR);
> +			return;
> +		}
> +		if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR ||
> +					blkaddr == COMPRESS_ADDR) {

is_valid_data_blkaddr()

> @@ -1685,6 +1721,12 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
>   	ASSERT(ret >= 0);
>   
>   	fsck->dentry_depth++;
> +	new_dentry = calloc(sizeof(struct f2fs_dentry), 1);

ASSERT(new_dentry != NULL);

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
