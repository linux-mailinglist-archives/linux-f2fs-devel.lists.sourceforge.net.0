Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519791986
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 22:23:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzRiC-0002TR-Op; Sun, 18 Aug 2019 20:23:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hzRiB-0002TJ-4I
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 20:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Igx9LKkxc/Ed+buhGGebCgajgTQpZPfdPTrkftAeYZo=; b=Id6pNpG+q96D8Cp/o4SIAiesGp
 kVsIRbT4GV8RCeny8iyo2yVOh+dQ90jZ1j1/SU00j1pKP5rISmlFva8DEaX9PvWJRBeROu/c56TLC
 VHcbbNt3qNlIU2Q7dH9b4Tm3PcFQyvc/qok7J4q9Y9NAYuSI5zYKHhwJcvPWLzVJPbOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Igx9LKkxc/Ed+buhGGebCgajgTQpZPfdPTrkftAeYZo=; b=deyytENQROiWFBSedXmbYuy4qj
 qwLWCBk+bn71C0TF4V9UErVvsPjzkq27OfG7FcX9lgSAlOMmAft0vkM6ttlRGlImeFuNYIzl9Gl5L
 2mk0sUJOuu5Rxb1rFJbWw6MqRRWkHjhZuk6ZQqr1bSllltlUiynD6y4p4UdkPq9U5Bxo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzRi7-00831e-Jl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 20:23:35 +0000
Received: from zzz.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0403206BB;
 Sun, 18 Aug 2019 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566159806;
 bh=l4MPxofEYLzifGuPs6XDtAT9a/yuc6fcqOwyHG5pdS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kZB/VaSlYYtF6xM0yC8ONXMb46+KVmwjvPGk2hTcqQiL7tLTsMemFe043L6R8sh33
 OhiYdoyy7swXwbQzlYelx0CWvv05WB3Ig+LQPPsj9i4UY6+9ACvkn9nKmRsQLbsfsv
 OL/iuBbbJ4zaURfruZyggkWH9QOKBH2FiCPswni4=
Date: Sun, 18 Aug 2019 13:23:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20190818202324.GA1824@zzz.localdomain>
Mail-Followup-To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190811213557.1970-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811213557.1970-1-ebiggers@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hzRi7-00831e-Jl
Subject: Re: [f2fs-dev] [PATCH 0/6] fs-verity fixups
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 11, 2019 at 02:35:51PM -0700, Eric Biggers wrote:
> A few fixes and cleanups for fs-verity.
> 
> If there are no objections, I'll fold these into the original patches.
> 
> Eric Biggers (6):
>   fs-verity: fix crash on read error in build_merkle_tree_level()
>   ext4: skip truncate when verity in progress in ->write_begin()
>   f2fs: skip truncate when verity in progress in ->write_begin()
>   ext4: remove ext4_bio_encrypted()
>   ext4: fix comment in ext4_end_enable_verity()
>   f2fs: use EFSCORRUPTED in f2fs_get_verity_descriptor()
> 
>  fs/ext4/inode.c    |  7 +++++--
>  fs/ext4/readpage.c |  9 ---------
>  fs/ext4/verity.c   |  2 +-
>  fs/f2fs/data.c     |  2 +-
>  fs/f2fs/verity.c   |  2 +-
>  fs/verity/enable.c | 24 ++++++++++++++++--------
>  6 files changed, 24 insertions(+), 22 deletions(-)
> 
> -- 
> 2.22.0
> 

I've gone ahead and folded in these fixes.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
