Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A210140F2A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 17:41:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isUgh-00058W-DU; Fri, 17 Jan 2020 16:41:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1isUgf-00058L-KP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 16:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnccLV4YJ8g8tNMCugTVV6iG0yVTkvzFsgihH/j8hyc=; b=X+c3RS2b0iigC1lx3DF6Cdbv6R
 o/HQsImYNaPZtDqUT4WyEbHmwzZnINMZxbaQHGAJP85mG76VnIvx1id0bMTnyD8MQBWLuTsoHqory
 c2LfKT2yWoNsphifAM+3Sn/eMbpF9F+HM9ivn5LLJOGd2A20syEhXGfpRdJ7A0s+xa5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vnccLV4YJ8g8tNMCugTVV6iG0yVTkvzFsgihH/j8hyc=; b=ddHL+GgIYTn0bscCoD7++a2lZt
 Tb8RgvAHg/1frJdxsqt7+wCw18NTwXAb2RT+SuZmD/BUicKo7ZVVsZkJ+mbnL8OWCIR3frsqTHg9P
 QqjYfR9/4eaa816e3Dsl2PDa/WewTYI845Mln8qP4skYLeHvkKLb86y1c5UWcJufZ6H4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isUga-008NV5-Vt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 16:41:33 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00HGesH5016861
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 11:40:56 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 44E2E4207DF; Fri, 17 Jan 2020 11:40:54 -0500 (EST)
Date: Fri, 17 Jan 2020 11:40:54 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200117164054.GD448999@mit.edu>
References: <20200116192008.35766-1-ebiggers@kernel.org>
 <20200117081246.GA16846@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117081246.GA16846@infradead.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.5 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isUga-008NV5-Vt
Subject: Re: [f2fs-dev] [PATCH] fscrypt: reserve flags for hardware-wrapped
 keys feature
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
Cc: Barani Muthukumaran <bmuthuku@codeaurora.org>,
 Gaurav Kashyap <gaurkash@codeaurora.org>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2020 at 12:12:46AM -0800, Christoph Hellwig wrote:
> On Thu, Jan 16, 2020 at 11:20:08AM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Reserve flags for the hardware-wrapped keys feature which is being
> > worked on [1].  FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY will denote that the
> > encryption policy needs a hardware-wrapped key to be unlocked.
> > FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED will denote that the key being added is
> > a hardware-wrapped key.
> > 
> > This reservation is tentative, and these codepoints may be reused if the
> > feature is not upstreamed.
> 
> NAK.  While the feature itself sounds really useful we don't just
> reserve format bits for code not upstream.

I disagree; saving a codepoint to avoid accidental collision of a
feature bit is a good and proper thing to do.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

							- Ted



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
