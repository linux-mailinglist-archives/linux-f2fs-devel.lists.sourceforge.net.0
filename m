Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B76FD3A2EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 10:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvUyY8wJqkaJjpPbybz9SWndgOiESOIXteXcQzjZMIs=; b=G9TLRruADTKpQEgc7+Lp8GWO/4
	wRPj1LTifYExTvVWZXLF2p4R5/eQkEAUfAqI4Cv1mmCJl5+46TiXED7Z+iwgjWFFEvCwoaB4DSWFK
	KP8XgmdCtPar47701CqlnkRfNlfgYNSrIGzdCsFxIrq7cLdpQ8VgtzOreo6NhdpFSw8c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhlYJ-0003e0-MO;
	Mon, 19 Jan 2026 09:28:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vhlYI-0003dl-Jn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sh0TkxkEOKhDl2DVrl4mw+NTqDA2lqqTM0EYMUUo+sI=; b=DZ2ybzdiNU0YUiq4as3MnC1cbK
 UHnb1l07bx6JAP1rCuMVkQFdLajrIVeuWAxumFFa1vNq0SkD9PUZ72rc+FaJqdQQ+F1CRtkO0pE0y
 44BvEHaKn2aopnZ03qMjkIyeLyZWCPPp9S9WZJrwUyWdOfJC3Zk7I0cDUG7wJTrDDpE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sh0TkxkEOKhDl2DVrl4mw+NTqDA2lqqTM0EYMUUo+sI=; b=AmyElY/FHQ/gnRlwGvI0dwKlsB
 9K3kZDb5zuWHSESGcwBA+a5YSWUqumYiyV5MOlQZBTjkzB71++Mbwz0OxjtNpQKwp6bsv81zAszX1
 BNkafNmkAkebM75aitqQZxptBbyu59bCiAicPqyvD+wVCdLSSx8DyxhbXSLyiL9BZtL0=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhlYI-0000Nb-52 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:28:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7696C227A88; Mon, 19 Jan 2026 10:27:49 +0100 (CET)
Date: Mon, 19 Jan 2026 10:27:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20260119092748.GA10125@lst.de>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-5-hch@lst.de>
 <z4652hoxetll645hgpfuhy3pogm5y32ealgydlaz4kwve6qc2g@bl6ilzut2ybp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <z4652hoxetll645hgpfuhy3pogm5y32ealgydlaz4kwve6qc2g@bl6ilzut2ybp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 10:21:00AM +0100, Jan Kara wrote:
 > OK, but since __fsverity_get_info() is just rhashtable_lookup_fast() what
 > prevents the CPU from reordering the hash table reads before the [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vhlYI-0000Nb-52
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 10:21:00AM +0100, Jan Kara wrote:
> OK, but since __fsverity_get_info() is just rhashtable_lookup_fast() what
> prevents the CPU from reordering the hash table reads before the S_VERITY
> check? I think you need a barrier in fsverity_get_info() to enforce the
> proper ordering. The matching ordering during setting of S_VERITY is
> implied by cmpxchg used to manipulate i_flags so that part should be fine.

Yes, probably.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
