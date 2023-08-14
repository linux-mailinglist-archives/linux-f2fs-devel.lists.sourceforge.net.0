Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F877B7B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 13:39:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVVux-0007md-U0;
	Mon, 14 Aug 2023 11:39:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qVVuw-0007mV-OR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 11:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CBdD/c9taZbfk8ckRsVUg5HdMT2PJm8oFdBr6g19unI=; b=L4PwdC7H3ss7ks97TLagAu++eW
 iocE2lW55dpCJqNzbNbZHWpA/dWW6jbeQDmMqeLmbwsSnbqz4HqAH5HFGLauLi5csrEyIFpLnFEVA
 YfqE4IvJoILgPKlOIm3YhTokA/BlL2j2NdMG/2pcNe4ixHrybTrqx8Ee+D12OefWu+vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CBdD/c9taZbfk8ckRsVUg5HdMT2PJm8oFdBr6g19unI=; b=OYXLh4F5VXuudyigLHSKc5SumK
 THChHrJLZd1ImZua6d9CGRx8e6Oid5ykcIZYAAUG6CyX1cyhWH8RVlYcGQGtgwV/RY48C9FaB80El
 QX5TPSRGt1+rIVaxZgKqNuI41kRReK8RrPS9oTceZizgDWVxG/XlyP5XqYN7zn+DmjnA=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVVut-0006ZT-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 11:39:25 +0000
Received: from cwcc.thunk.org (pool-173-48-82-92.bstnma.fios.verizon.net
 [173.48.82.92]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 37EBcql3029730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 07:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1692013134; bh=CBdD/c9taZbfk8ckRsVUg5HdMT2PJm8oFdBr6g19unI=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=omyRU0yyyUqJ/4DlttOwQYA6FIp1uOxkueF1h5sT+nLom9qPG2OXpn2ZLOwPsKIO8
 9JTzlwTdXCiZWrC+qrCxE9IyQV9tk7OqmTKDLaPogX6eFWR3luHTlH98IV8Q6j8Aiz
 JdtWUQaz6bJyDLForrT9VYSlgko5gpmf2SseYOdHf7eV69lpic7il7xLJx4OI8w6KK
 02EKaPaTCfOS8oughn8MH8+CeYhqSCLow5/jrtNhMH3x6usoMHKcjqo3D/8gAWmw58
 N25e/WZaYsrmw/ojBYaqctRyOrfhi8Ude+iRuCVD6XWhEabUcBj6qqpQb5Q24VxyYq
 iBnKnnnfpzemg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 0F2C915C0292; Mon, 14 Aug 2023 07:38:52 -0400 (EDT)
Date: Mon, 14 Aug 2023 07:38:52 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230814113852.GD2247938@mit.edu>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
 <20230812230647.GB2247938@mit.edu>
 <ZNhJSlaLEExcoIiT@casper.infradead.org>
 <20230813043022.GA3545@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230813043022.GA3545@sol.localdomain>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Aug 12, 2023 at 09:30:22PM -0700, Eric Biggers wrote:
 > Well, one thing that the kernel community can do to make things better
 is > identify when a large number of bug reports are caused by a [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qVVut-0006ZT-Hw
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Aug 12, 2023 at 09:30:22PM -0700, Eric Biggers wrote:
> Well, one thing that the kernel community can do to make things better is
> identify when a large number of bug reports are caused by a single issue
> ("userspace can write to mounted block devices"), and do something about that
> underlying issue (https://lore.kernel.org/r/20230704122727.17096-1-jack@suse.cz)
> instead of trying to "fix" large numbers of individual "bugs".  We can have 1000
> bugs or 1 bug, it is actually our choice in this case.

That's assuming the syzbot folks are willing to enable the config in
Jan's patch.  The syzbot folks refused to enable it, unless the config
was gated on CONFIG_INSECURE, which I object to, because that's
presuming a threat model that we have not all agreed is valid.

Or rather, if it *is* valid some community members (or cough, cough,
**companies**) need to step up and supply patches.  As the saying
goes, "patches gratefully accepted".  It is *not* the maintainer's
responsibility to grant every single person whining about a feature
request, or even a bug fix.

       	       	       	       		   	  - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
