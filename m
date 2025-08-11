Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27178B20B16
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 16:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDoeXStWrwotMxIPFM4IzeialWxOGU4a+sw+s8BS/MY=; b=GWL9b5tlLjdhc9hSYsOYhLuOMy
	2wLS+L1Y6+Zb5IWtKG8WHhQ92cUQOV+EZMTUw/+KBfBtbnZSMvU3Y20gZTfHr+qrsO+EmJH78sBYb
	6Jlh67rKuVhaqMVphucWvcVwGL38KgSpB4+KjMOoiKT1uitszibEOYS1jPnzFc+bvuis=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulT6f-0003pO-VU;
	Mon, 11 Aug 2025 14:02:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1ulT6e-0003p7-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 14:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g+wHT+PT93hDCFnxg5ehJ/knwkjGZnIt2PT+tfJfvuQ=; b=izTtOIrsUmrCcoiIQD3NqoKuH+
 Pbj5ZZZjXZqfnjyJZ1CApTnSb08jWMeLE82OMDmVoh5H8dpkHD302p1x1Nn3uh5jjoUFxiO+5jd/U
 iCA7Ot42AAnzn60XRCRD4gVlWrkxl8MUFUw+3P8B8i0Zc7hEYWHYb7vfJQRZ/0xS2Sko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g+wHT+PT93hDCFnxg5ehJ/knwkjGZnIt2PT+tfJfvuQ=; b=koNdSJbNnvyq4b+HQm7NQhxp9D
 D7I0Wwhltqm141i9EtOqhWCX1yRjvdRYb9pJMJ9Jo53MDNoczmDyqQxXQXBZwWtDt2UlOEm661eQY
 Y0dHGd7f3Tap0kM79ccmRhd53cgaq2rhf7QrGq8RiAgozh/CTECy7/bqhzgbJYx5e3fk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulSge-0004e3-3k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 13:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B001C45357;
 Mon, 11 Aug 2025 13:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E39DC4CEED;
 Mon, 11 Aug 2025 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754919329;
 bh=JU+C8jrRoBvIHpuTBFOVPaJSBYeLJuKp6ZRbyTV8tUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QanpJ1FFAEOTenI/ZExSMKMWz/vWwwP0RGPtT6qjmkKBX4nap9yqO0U3SmhN0mft7
 0XEsDyKzmiQ3MPArUXx7Xibr1PndFK+QUTgL3JK9LaIVUhTreuZbdIBreTgk2CfMxQ
 Gm8/UGW+xYIDrCTnXv0I60EocErHUvb+5Kqq7DSDZ/mQ7zNKRfJUzcxUkMhzug1uD1
 8bh6XQagbanat13424yqY1iXeT3fLg0pvOpA0uXXnszQuwLw3dGXGt6BbyRF22ekUs
 JmUCratJjiyWB9323y6oClHqu5I+dElILQ4KxZ59JBn8QQ28Rbay5gQFZ4RXLQSWSB
 iV0FOE4Xqmf/Q==
Date: Mon, 11 Aug 2025 15:35:25 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20250811-weismachen-anhieb-987a766c8e6e@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <aJixkUfWPo5t8Ron@infradead.org> <20250810170311.GA16624@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810170311.GA16624@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > The fs-specific field solution from this patchset is much
 more efficient > than the rhashtable: efficient enough that we don't really
 have to worry > about it, regardless of fscrypt or fsverity. So [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulSge-0004e3-3k
Subject: Re: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out
 of struct inode
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> The fs-specific field solution from this patchset is much more efficient
> than the rhashtable: efficient enough that we don't really have to worry
> about it, regardless of fscrypt or fsverity.  So I think it's a good
> middle ground, and I'd like to just do it this way.

I agree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
