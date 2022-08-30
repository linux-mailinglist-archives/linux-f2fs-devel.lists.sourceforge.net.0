Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 807785A706B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Aug 2022 00:12:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oT9TT-0005VI-GS;
	Tue, 30 Aug 2022 22:12:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1oT9TQ-0005V8-Ml
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 22:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e6ECjud0RvU+17l0f8ers2t/ZahEM9K2CEQ8DVNTkhU=; b=hV+SCjj9H6TtPRXQdNU4VpSoKP
 yk6O76AyDdP3bRadbtvnBgE3KSCr2XHKL/okaOjEq5NfwTpKRpiNSnCbUUkobguu4Efv6uAg0uNR7
 /pae2PbWjzg4YAiyDOIoZf/5C/xLtbg7gqi8WwnHmgeALaJBE0AMMMC+nM1l1vpx5r/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e6ECjud0RvU+17l0f8ers2t/ZahEM9K2CEQ8DVNTkhU=; b=QabGC3USnXqFaji6e568X33UPi
 MUtMaabXH4E6aFpd4rbTC1YXiBv/4ckjVvxz4FMuSj5Y/Hf+lEBa6d+KTHvbXp5z7LlsIJooIOtGr
 2MJq4J3VPBkrzt1mZ2S6DM5KnHUVou3A6p3te4u1+JMI4ycL2zixVaovZlAIRg1rq3xM=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oT9TL-0007BJ-6o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 22:12:44 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 27ULutcM017607
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 17:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1661896617; bh=e6ECjud0RvU+17l0f8ers2t/ZahEM9K2CEQ8DVNTkhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=n12BuM4kMIcAtdJ+mN0a3TcF7JAtsz6qkzrCHycY9C77IPBuP1QeuTx3F9IxiXtS/
 Jf2UdxXOl4lWg8ti1rY/0refzzBzhzHOjyb/N3zV6gEsUbz8wmQcei1H5id9mKQMdP
 DkswDdUi97sFdw/8zYV6uRLvoPbtiJn4RUPb6uJqbdeo6txLWhpYA5DAEfGY1w24Jw
 Rk4iO+p39tkxHRDwj1HLmvhfxv3b8/GuGfmCQbEZ0y/p1FAk7hIB1BDNPSG20e2q4e
 kkw9FDKLA4tSlJvloxDEzePU47rxkLRagsyRDdR0ZEyp4QlgzBTOEm9R3pTLlizQ1X
 uXoI07k5kUPbg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 5303315C3434; Tue, 30 Aug 2022 17:56:55 -0400 (EDT)
Date: Tue, 30 Aug 2022 17:56:55 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <Yw6Hp8l/7p3wbiGq@mit.edu>
References: <20220829235429.17902-1-rdunlap@infradead.org>
 <Yw56rVwBRg0LbC41@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yw56rVwBRg0LbC41@ZenIV>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 30, 2022 at 10:01:33PM +0100, Al Viro wrote: >
 On Mon, Aug 29, 2022 at 04:54:29PM -0700,
 Randy Dunlap wrote: > > compress_log_size=%u
 Support configuring compress cluster size, the size wi [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oT9TL-0007BJ-6o
Subject: Re: [f2fs-dev] [PATCH] Documentation: filesystems: correct
 possessive "its"
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
Cc: Christian Brauner <brauner@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Seth Forshee <sforshee@kernel.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 30, 2022 at 10:01:33PM +0100, Al Viro wrote:
> On Mon, Aug 29, 2022 at 04:54:29PM -0700, Randy Dunlap wrote:
> >  compress_log_size=%u	 Support configuring compress cluster size, the size will
> > -			 be 4KB * (1 << %u), 16KB is minimum size, also it's
> > +			 be 4KB * (1 << %u), 16KB is minimum size, also its
> >  			 default size.
> 
> That one doesn't look like possesive to me - more like "default size is 16KB and
> values below that are not allowed"...

That being said, it could also be rewritten to be easier to
understand.  e.g., "The default and minimum size is 16kb."

	     	   		    	    	 - Ted






_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
