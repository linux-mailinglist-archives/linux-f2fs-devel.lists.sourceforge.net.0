Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 657ABC0D584
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 12:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuQFiOwkA1RivlYVXWHyy3SAvMrmZEbqn7qigy6pF24=; b=FDQoEqH3bGRqRFZ4ayjJzfs9xU
	6vgAtOwoBl44Lu+uqXPLHP7AqZgtBQLUqCP7FrzPWYA0Qm6oOrpHX4CiqgAXIrLrYYxEFKkYXlDKI
	N/0x4Ca1SJimqYCuZL5WOSTHJu4drVgAHtsPhMwvMCTuuT2Mq0tpBuds/duABOQrrj2w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDLrs-0001qH-Uq;
	Mon, 27 Oct 2025 11:58:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDLrS-0001pd-PP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 11:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Am1Ji70vr3ASoPaf86l8JECKSn3ZtcabbuNBFuhAHqs=; b=VvtP8NAsQ0Ic7Cs8RGOZFi8Mbm
 OcvGZt7/FB1CWZw0WEpJP8R1p11aoEO/1XyBV9ii7HZMOeQLNdIMT2Q3kbaAvB5tIB9CUSsmY0Lih
 DsPtCVTYOzdHG9628tm1SbLux9JiZJfDoAhX80J9n9uPmZyKyGM730QfPtyuXnUjPXvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Am1Ji70vr3ASoPaf86l8JECKSn3ZtcabbuNBFuhAHqs=; b=gWPinczVBrjoRmgcuuAP1piv6A
 C9WcTMRf6/FNps4aaL05687ysFY2Yn4bfsFfR4IUsEAjpKZQPIPtDyVLaVJcP/vPIQLXmzNe9DPk2
 4DD34ULsfa8DVLgd7O7Rom7jK6vg6qULuCbdW/Kf3NXE91OmMvJ7P4PWoyj2xXf0InZI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDLrJ-0006Vg-Ej for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 11:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1ECE04362E;
 Mon, 27 Oct 2025 11:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73975C4CEF1;
 Mon, 27 Oct 2025 11:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761566267;
 bh=X/YRT3VYVQqffQQNZRHkBdGv+a6Gavg2kFI3+ns3fgk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AOewutWBGHLzYkqG/ZVV2ev1jfPjsY/zPRJIwsa4zLRoTwB1hDGbQ8x7hso2qEm6S
 WiTuJRpCxD4WJxp0O/VOwYdfrvbBxtuvij3xuxaD3RMwvD+w+O4WkHL7uLFnI8P0b1
 MKwhKpLbAQXUXUx1dZIRZTWoD6zOp8mhI9KsSRI+kQ+N8VJQgUdTJBT/yRSpItbujV
 /re619m0jermgwnEGIU2oRqtlgOphSDS26VDBCr0Y6OYkxJHF4wQRkWR+9/xweQhUk
 8870Kts5+BW58dVKUzrpOM8mMyCtdTSRCQK6mXERq/H2wrGZGeTGle/jsucuPw08ld
 41paf0I71dw2g==
Message-ID: <f72e6db4-362a-4937-884f-7b28a5a4e9dd@kernel.org>
Date: Mon, 27 Oct 2025 19:57:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
References: <20251024170822.1427218-1-willy@infradead.org>
 <20251024170822.1427218-6-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20251024170822.1427218-6-willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/25/25 01:08, Matthew Wilcox (Oracle) wrote: > This is
 one instruction more efficient than open-coding folio_pos() + > folio_size().
 It's the equivalent of (x + y) << z rather than > x << z + y < [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDLrJ-0006Vg-Ej
Subject: Re: [f2fs-dev] [PATCH 05/10] f2fs: Use folio_next_pos()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/25/25 01:08, Matthew Wilcox (Oracle) wrote:
> This is one instruction more efficient than open-coding folio_pos() +
> folio_size().  It's the equivalent of (x + y) << z rather than
> x << z + y << z.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
