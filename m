Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55EAAD8D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 09:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxYHbY3b+vdqcbHdJO+Uths4BYoe1Pk7uoqPeIJrXIg=; b=W30GHsFdneQYwpiWSUAXFJhHXb
	SKhKLbh8R1Wb0qkAQxHAPj7yVLBt+hgHdntT46/z62STcQ5jmZuWhKFWV1K7Yd7vUpW3uRHH3hg0t
	A1I1boBcqwUOhMJGUkapyIeTrGGOJgXKt9VbMcu+a3+5Pb3IxEGG2zxfIfMKzLEprQik=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCZWU-00030m-4Z;
	Wed, 07 May 2025 07:48:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uCZWJ-00030X-T9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e6huWnhgxFQ8bjGzWKZybwdE+ZlNVdAP3gw/ZnaEVN8=; b=VeNnnIb4yY7ZxzvY1v4AMGrVxL
 JYUd+lpi0PCZyj0V1zcCpm2c/47c8r6Iuh+hYiICmistjmmiAbDfKxbnLEpu6DMaeuclsXiZZ7U+g
 SBtzqZ/reiKT+iQCuX/PYHsfJ14zaftMMdvbXMxYo3vrXRHV43KpWmIR7DnhcOLDBtSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e6huWnhgxFQ8bjGzWKZybwdE+ZlNVdAP3gw/ZnaEVN8=; b=KoeTeYZtH0nPbCiDWYIQMQeLaw
 chamvq3WYIcmngD8jYNHQJk1PtA3xAP1DOjTv2eexpLb/maPI4h+bcIavPYpQBnS6Ik5ssRJJB7YE
 BCoemDqDjPbp9nYBZwM5rt2O/gih32/O2ETxN+U2KdzfDXTtD23LGOJQtlmUC7wZFhhk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCZW4-0003tA-3m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:48:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E2F5268BFE; Wed,  7 May 2025 09:48:17 +0200 (CEST)
Date: Wed, 7 May 2025 09:48:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250507074817.GA4516@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
 <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 07, 2025 at 03:38:20PM +0800, Chao Yu wrote: >
 On 5/5/25 17:25, Christoph Hellwig wrote: > > Hi all, > > > > this almost
 entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs. > > > > [...]
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uCZW4-0003tA-3m
Subject: Re: [f2fs-dev] cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 07, 2025 at 03:38:20PM +0800, Chao Yu wrote:
> On 5/5/25 17:25, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.
> > 
> > f2fs_sync_node_pages can still return it in a way that is not handled
> > by any caller and eventually is propagated to userspace.  This does look
> > like a bug and needs attention by someone who actually knows the code.
> 
> Oh, I guess this is a bug, thanks for catching this.
> 
> Anyway, let me fix this based on your patchset.

I'll resend a fixed version later today, maybe wait for that.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
