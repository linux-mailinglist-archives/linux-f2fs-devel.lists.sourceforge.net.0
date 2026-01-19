Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E107D3B6BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 20:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBCFcbnFQOpTT5GK44h/jfAE1eLu965g/Am2wQ6hyr8=; b=hXr2PpDB9kdTy5k7KVWj1+2gKH
	lWPg0+ayCSwqgUldg1uaNb0Gm8gR4ohOAfkPAJooo/jyCeNYAyg3GWK9po44m8sDtiWdOEwx3rrbS
	iDxgCUGoxG8ONXSBVsb7CgPV1fjTcLR+H+qlQ/AfEeRpj8phE3M8BBt/8KP9sXH5Nokk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhuZv-0003Ma-AF;
	Mon, 19 Jan 2026 19:06:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vhuZt-0003MU-NE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 19:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1EKinB4Lm6EZf7nKTWDUJkGBiIlQQ2RWlqWqXDWPpNk=; b=jJFvBSnMdD4S6OQe6U8hqEqeJG
 v3bo6bjZqIQKI/qLMOFqkLWN3SXlfYxS0rOGl9ACfWC79MWVL7pPmtuJM9qY8X0SKcLm38erb7lh0
 MwhGOR9kHl37VX4ZFEIwMSLe3AiXXhDiLyzzEzlVXUKY3ThXmZ2cupL6/FG/zz3wjahc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1EKinB4Lm6EZf7nKTWDUJkGBiIlQQ2RWlqWqXDWPpNk=; b=gVlzjw6Sie9xi8yPuhMcLRoiI0
 /HdZ7TG/gN8ck+Uj70g2P3kKLnr0FY3/hNCBudNimq/NeNYMa00fyCmE0xmGKFNsiQTfoee03az0c
 qXkAp3MM1TmfGQvj8So+lS96ejZll3s1KWZZ6Vt3XANMiBycXcQOrSRsqYzaCqZVbVNs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhuZt-0007Ec-6D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 19:06:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 83FF760054;
 Mon, 19 Jan 2026 19:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B61C116C6;
 Mon, 19 Jan 2026 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768849566;
 bh=qwc08ec1OrctlmlBAKmKSTt74F2eGcEv59WaOb2w5eQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PtfZTXUqDM7feQgU5ZToqJgQZfAEbmvBY6pgybD43xWXMt5+0d1F/AgDFH0jYr3hN
 Pv34MqMPrKVWxKgQxA0z0xO8T97+YdKXpxYk6pduxC2A9PoYfLeL6fDgupt3wQfjzS
 r1XxlTijMiBjFLZMphMJtVvD+qfHuUItPnUWutZS57l6KjV+OeTtq3cuHYs3J+GH/h
 PorU2xUi0AWmM8VF9IoYarXTtpg9RSEs166be/N2rOnQ4gsZCfXJIKV93gkLJV5LZW
 2GcKQ1fLhawecTS6hTvIBY1iNsWS8OyaUpNnpTJsrGgkBruC/e4kIZLMpDLhm0gNgL
 VDhQpjkvpFydw==
Date: Mon, 19 Jan 2026 11:05:36 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260119190536.GA13800@sol>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119062250.3998674-5-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 07:22:45AM +0100, Christoph Hellwig
 wrote: > Use the kernel's resizable hash table to find the fsverity_info.
 This > way file systems that want to support fsverity don't have t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhuZt-0007Ec-6D
Subject: Re: [f2fs-dev] [PATCH 4/6] fsverity: use a hashtable to find the
 fsverity_info
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 07:22:45AM +0100, Christoph Hellwig wrote:
> Use the kernel's resizable hash table to find the fsverity_info.  This
> way file systems that want to support fsverity don't have to bloat
> every inode in the system with an extra pointer.  The tradeoff is that
> looking up the fsverity_info is a bit more expensive now, but the main
> operations are still dominated by I/O and hashing overhead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Has anything changed from my last feedback at
https://lore.kernel.org/linux-fsdevel/20250810170311.GA16624@sol/ ?

Any additional data on the cycles and icache footprint added to data
verification?  The preliminary results didn't look all that good to me.

It also seems odd to put this in an "fsverity optimzations and speedups"
patchset, given that it's the opposite.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
