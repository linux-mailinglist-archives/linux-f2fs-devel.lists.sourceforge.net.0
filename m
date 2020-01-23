Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6D1460A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 03:14:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuS0S-0003AM-AS; Thu, 23 Jan 2020 02:14:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuS0R-0003AE-CB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 02:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HSZLJHaxiDRdE5kld4O3wE8BZ4k4mVCAU7VWi5Dw//8=; b=N6YtDbgU8csOjVkjBxjWkApf7S
 kUd1Aaf1v/sGOHXinzd05ceCkZU52hEZuQRJqaEiDIsriRP3VagFTiMw8ExX98FVKSioTpTZwM65N
 ObNFowWU8A92hczgiXqE5eihf5WfZx58SpdK4wByVTvyTa8700jJHZ6AR4smEw0eA8YM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HSZLJHaxiDRdE5kld4O3wE8BZ4k4mVCAU7VWi5Dw//8=; b=hGzqa2gyEuIn/0HLy1tmvfptVF
 CYsg2uCZewIEgfoeZG8zo6t1zyY+9FDmMVSXMWVl2YJGxwk1PordA8ANOejGhuMsq7SVW3Zef8XR8
 p9LZc5uOloVmWNLe12vebgbwVUjnZeDmOLsmHNIbCnOx00zZjXDmcscoNCeUeTRDwRuQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuS0N-001mgi-5C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 02:14:03 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CEFE24125;
 Thu, 23 Jan 2020 02:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579745628;
 bh=UVtHGuBwD4NKnOj+Kfsya+kpYb2Ei7ghhepkkktbhCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDZDIFzZTL682ulrwViKOe3ewyQMdqkVmdmvds4xrpPq8JiU9RfR7qcpjFRab+o8R
 PiUYSZiGGtYjMeFGuBcGEK/Qsg/TCaVD+tNFJWPm5ZNhjNF2928EPwaguDVdEh+cr6
 6tmFC6YDE4ITDDWouK47F3UXSqAHzvvr2BLnLGfM=
Date: Wed, 22 Jan 2020 18:13:46 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200123021346.GA862@sol.localdomain>
References: <20200123011354.75282-1-jaegeuk@kernel.org>
 <20200123011354.75282-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123011354.75282-2-jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuS0N-001mgi-5C
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Add f2fs stats to sysfs
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
Cc: Hridya Valsaraju <hridya@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 22, 2020 at 05:13:54PM -0800, Jaegeuk Kim wrote:
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index ce2936554ef8..7565ba9967dd 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -150,7 +150,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  /*
>   * This function calculates BDF of every segments
>   */
> -static void update_sit_info(struct f2fs_sb_info *sbi)
> +void update_sit_info(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_stat_info *si = F2FS_STAT(sbi);
>  	unsigned long long blks_per_sec, hblks_per_sec, total_vblocks;

Global functions need a "f2fs_" prefix.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
