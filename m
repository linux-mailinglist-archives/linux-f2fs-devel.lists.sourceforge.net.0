Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F3404059
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Sep 2021 22:54:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mO4aE-0001Fd-EM; Wed, 08 Sep 2021 20:54:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <tytso@mit.edu>) id 1mO4aC-0001FV-V2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 20:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sU3m59q5I8KIXHpE4A0uHYYk/DsKrSCayjV7iEizTFY=; b=LBd5VI7k3ZbMBuj8RvTSAevR7h
 N0N4w/4SzSDMwD+cbo/jLBPo3oj98AwDmXhg/r+uKEMSCRP5nXt39XO4AZY17sJzdpq8gl35DYze5
 b0fuLvUGCxxEqUGtwAwlIIglADA5wRt1HdnpsS5jIv655yymxrJWRFvsKajuzuje+hmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sU3m59q5I8KIXHpE4A0uHYYk/DsKrSCayjV7iEizTFY=; b=BS9ePYItumUsE58+xaapEQFJgO
 CQ4z2XJiyf7TOhEl6mYaDwBIovgqC3h6nLIf8adPYEJoSyfnU+icTpev+rpVLdpscxklr3ZTqu1MF
 vMIHg4rwD3ZtkrvO9my8CMjd/VBHyBN3aCkldonWdQ+8Niw32fImf2vdR8lzlPlkiNGY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mO4aB-003qoP-0W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 20:54:12 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 188Krv5F014651
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Sep 2021 16:53:58 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 3A12D15C3403; Wed,  8 Sep 2021 16:53:57 -0400 (EDT)
Date: Wed, 8 Sep 2021 16:53:57 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YTki5erl7fbGHVUL@mit.edu>
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818140651.17181-2-hch@lst.de>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 18, 2021 at 04:06:41PM +0200, Christoph Hellwig
 wrote: > Return the encoding table as the return value instead of as an
 argument, 
 > and don't bother with the encoding flags as the caller c [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mO4aB-003qoP-0W
Subject: Re: [f2fs-dev] [PATCH 01/11] ext4: simplify ext4_sb_read_encoding
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
Cc: linux-fsdevel@vger.kernel.org, Shreeya Patel <shreeya.patel@collabora.com>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 18, 2021 at 04:06:41PM +0200, Christoph Hellwig wrote:
> Return the encoding table as the return value instead of as an argument,
> and don't bother with the encoding flags as the caller can handle that
> trivially.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Theodore Ts'o <tytso@mit.edu>

Thanks,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
