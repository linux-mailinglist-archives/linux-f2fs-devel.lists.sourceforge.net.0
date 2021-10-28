Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B105143D929
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 04:07:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfuoy-0002nM-N9; Thu, 28 Oct 2021 02:07:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1mfuox-0002nG-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 02:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I7OjA+d+nnjTHHVsR6adopAmpWTJSLFl8VcfezhZxw4=; b=CDl2JDDoShw+HGHHkQky6lvyhj
 Kzcdyiz+hK6bnFclq8mH5ODruxTmQUZzu65BeOzn9t4Ib88dp+JXThzdGkV/+6RQSozIxrbc2ixcC
 KBUMikgtVhh4bkRW1BEdh9B7gS4TZXjbZsmmLh8a/HldX6/gfg2/EOUXRr9UMSGicKho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I7OjA+d+nnjTHHVsR6adopAmpWTJSLFl8VcfezhZxw4=; b=BPfkr/Wd4i7NFHgsVg4ONZQRrS
 mdAMnUs09xKyixPWhCJ1LE8IzVeQHlwH/RpAZpunQqnz8qHGnvaBg/TcLs6U8wg7dWq94in/eEdWv
 J4pr4j65cduAf+qzmRjUGeldGRg9RPBRHzmbtuJkNYMp09GjPP9Bs+lNgyouccW9JbX8=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfuj7-0002T7-T9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 02:07:10 +0000
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1002])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 066AD1F44AB4;
 Thu, 28 Oct 2021 03:01:01 +0100 (BST)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Collabora
References: <20210915070006.954653-1-hch@lst.de>
 <20210915070006.954653-11-hch@lst.de> <87wnmipjrw.fsf@collabora.com>
 <20211012124904.GB9518@lst.de> <87sfx6papz.fsf@collabora.com>
 <20211026074509.GA594@lst.de> <87mtmvevp7.fsf@collabora.com>
 <20211027090208.70e88aab@canb.auug.org.au>
Date: Wed, 27 Oct 2021 23:00:55 -0300
In-Reply-To: <20211027090208.70e88aab@canb.auug.org.au> (Stephen Rothwell's
 message of "Wed, 27 Oct 2021 09:02:08 +1100")
Message-ID: <877ddxdi20.fsf_-_@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Headers-End: 1mfuj7-0002T7-T9
Subject: [f2fs-dev] Track unicode tree in linux-next (was Re: [PATCH 10/11]
 unicode: Add utf8-data module)
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> You just need to send me a git URL for your tree/branch (not a cgit or
> gitweb URL, please), plus some idea of what the tree include and how it
> is sent to Linus (directly or via another tree).  The branch should
> have a generic name (i.e. not including a version) as I will continuet
> to fetch that branch every day until you tell me to stop.  When your
> code is ready to be included in linux-next, all you have to do is
> update that branch to include the new code.

Hi Stephen,

Thanks for the information.

I'd like to ask you to track the branch 'for-next' of the following repository:

git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git

This branch is used as a staging area for development of the Unicode
subsystem used by native case-insensitive filesystems for file name
normalization and casefolding.  It goes to Linus through Ted Ts'o's ext4
tree.

Thank you,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
