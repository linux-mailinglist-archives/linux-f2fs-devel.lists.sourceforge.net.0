Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6666AF6DCD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jul 2025 10:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP1lrNylyElMzfOVivtW1KslE7sfNPxbNP7PuH/9BEo=; b=kCProd19n5ifi9a18GJCrTXzuj
	hmMbxPyhSYW2tvRqgGVtWXX/j7Pv89GTivJ2A3p9t9jg4V9j/eyP0rFRSOw9BPHYzpGukm8m7A+a7
	+KwW+RJ4fZbWSkf9SX+JrVRWJ7CT3/iAGhLTziHThA8DhyRwJ4LLPQ5LLnDnH9cA6cV0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXFkF-0002Vy-HI;
	Thu, 03 Jul 2025 08:56:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+67f6620909e0c98f53ce+7984+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uXFkD-0002Vp-Ev for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 08:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m3wMoA/+lGXECQWR911SnI8xaBje/etmwtQiMaO7+lY=; b=lPFGpVeU51mfyX0OPbFkU78HUx
 3vILS49T+LazTvRmAvu32vsJGt/oMNzm4piXddDHGsITrCel3xKsaxLot7Wwk6A8GdG35GJ7A6rU1
 GlJ0sZ1nKX97OUF/blONVL1C9wR+auIfYNYg+D/rQeBv/TqUJqbb5Lnn6ZN37yfUUou4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m3wMoA/+lGXECQWR911SnI8xaBje/etmwtQiMaO7+lY=; b=Oi0lA9Ie6upMjvRvaLqUb3oCDR
 sqrynaiaHtW26AmbtPd24lhHLBNow6CD86VQbOu+/tG5bNCcR5tvxlCfUul8aPsjQ1hRIQvx6RatS
 xyQBdJuD9+MQx+2K/aMPk89+W6Smg01ELu5a//dqhUaOHMfJk9GxD6olurnQnQUydnfs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXFkC-0005yY-2m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 08:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=m3wMoA/+lGXECQWR911SnI8xaBje/etmwtQiMaO7+lY=; b=JeFKvOBoYI/TCgiqEEvNeN41tC
 M5oPFdSbtPMgCg6n39e5uZA5UhXhwIsPSI93tGcgTh0/4ELNPi3xnHCZx0F7q4Q7cCS+OgFZy4TKy
 XcSf7CK7E0+hF7RVMB5xvnm/ywlCLXqvZ7exdvrgE3Ua5vpmg8rzaIpARIE4N9kYbnRSypvBXC+S5
 kAwaz9WzV4Uv5ppJ2pSMlyku4TEbPdgfqjwaNe5+boo8p4u1UxIWa4qmMZ/oxq4hY6loFPqwlP2dW
 4FX3ftfkk4Z91Qwk05cjAZjBUXIvwC/ImemB6wQ3fWvj3iYEFLVpnJaCNmvw/Fq93IiMc6wNIdSMQ
 xGLFulbg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uXFjy-0000000AkOv-10oo;
 Thu, 03 Jul 2025 08:56:22 +0000
Date: Thu, 3 Jul 2025 01:56:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Message-ID: <aGZFtmIxHDLKL6mc@infradead.org>
References: <tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_0D8BB6ABAB0880DB7BFCCE35EDBC3DCFF505@qq.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 03, 2025 at 04:21:30PM +0800, Yuwen Chen wrote:
 > On the Android system,
 the file creation operation will call > the f2fs_lookup
 function. When there are too many files in a > directory, t [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uXFkC-0005yY-2m
Subject: Re: [f2fs-dev] [PATCH] f2fs: improve the performance of f2fs_lookup
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 03, 2025 at 04:21:30PM +0800, Yuwen Chen wrote:
> On the Android system, the file creation operation will call
> the f2fs_lookup function. When there are too many files in a
> directory, the generic_ci_match operation will be called
> repeatedly in large quantities. In extreme cases, the file
> creation speed will drop to three times per second.

This files to explain what you are changing in detail, and why
(except for the very highlevel problem statement here).

> 
> Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
> ---
>  fs/ext4/namei.c    |  2 +-
>  fs/f2fs/dir.c      | 24 +++++++++++++++++-------
>  fs/f2fs/f2fs.h     |  3 ++-
>  fs/f2fs/inline.c   |  3 ++-
>  fs/libfs.c         | 32 +++++++++++++++++++++++++++++---
>  include/linux/fs.h |  8 +++++++-

Also please split generic infrastructure changes from f2fs ones.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
