Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A27FD404
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Nov 2023 11:21:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8HhC-0006A3-3B;
	Wed, 29 Nov 2023 10:21:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1r8HhA-00069x-TI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 10:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U3BsizlEiPOBOv/RTu7du5t/nelKReTmv1o1GdtNllA=; b=Fp4VJNCYoMyE74WAq82en6Mmbj
 cTQHTrfk7AslFRQ5/VanrxOVyUU/Q8kx3JCYcel05P/3XoFgMizd+uKeWH6sy00oFB9fTVw9DGUk9
 m/iCXyu6BDwtf1cSf6OmKO4KPtVO/4yrr4ySZD679HFBgDomtSVDJ0/MQ5vl/GZiLKv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U3BsizlEiPOBOv/RTu7du5t/nelKReTmv1o1GdtNllA=; b=CmamChjWePlQz2aEu/j3rOrVY8
 b6LZVtK8dsTtqnU7ygM/h9D7phvYbdG1AMij+3Z1noy4KPLdQIPtLWAOAY5bwRfs7sFjVqY3DObAI
 PdbqLc8N0Tx7/bwH3mh85LzcCkhqVN7xvejsacI+ZByvc6rvulKphE4evpqAzvoGAZwE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8Hh9-0000Ec-4v for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 10:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86B0861A09;
 Wed, 29 Nov 2023 10:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499FDC433C7;
 Wed, 29 Nov 2023 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701253276;
 bh=8TNjAboxiQCy/aqySF5iW9tbp3JOh4XvvQZCD1R3+KE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aWdAckbpxi5sMiKpOoUVyVGd+sJzQHppJ5GdXnwg/vT1OEkjFYBfAWJe6Qj35Dm+R
 68SGHuD24EeDw5Q99y55vcirXhp8eFF1UHSU0eIwa0N4/wAwg0dn6NxhGJ6s9ga6NU
 OHrocLcmczVvowoP7ib1VmF0ktm1NgxPVqeCBE+02C8qypswDN4NIWLlWaMtgfNtpw
 SlOPEVmbWg1FtXs+XyL1l8Oaxc3cFsfxzegQVWH1cSIO17hn9rSnlXCMJ3vSkBnfxK
 3538fPYIhC/RjduiM180EBUhQ7BcZwhBnF0TQ1X06K4xfMApo3bTvpmkRAp4LTAadk
 SUAnyDLa1FAyw==
Date: Wed, 29 Nov 2023 11:21:10 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20231129-birnen-erwandern-92bfa945d3e0@brauner>
References: <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <87leangoqe.fsf@>
 <20231125220136.GB38156@ZenIV> <20231126045219.GD38156@ZenIV>
 <20231126184141.GF38156@ZenIV> <20231127063842.GG38156@ZenIV>
 <20231129045313.GA1130947@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129045313.GA1130947@ZenIV>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 2) lookup fails. It's already possible; e.g. if server has
 I think that's the sanest option. The other options seem even less intuitive.
 > not fatal. The trouble is, that won't be a transient failure - > not until
 somebody tries to look the old location up. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r8Hh9-0000Ec-4v
Subject: Re: [f2fs-dev] fun with d_invalidate() vs. d_splice_alias() was Re:
 [PATCH v6 0/9] Support negative dentries on case-insensitive ext4 and f2fs
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
Cc: tytso@mit.edu, Miklos Szeredi <miklos@szeredi.hu>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> 2) lookup fails.  It's already possible; e.g. if server has

I think that's the sanest option. The other options seem even less
intuitive.

> not fatal.  The trouble is, that won't be a transient failure -
> not until somebody tries to look the old location up.

Eh, nfs semantics are quite special anyway already. I'd rather have that
in lookup than more magic involving moving mounts around or having them
disappear (Yes, we have the detach semantics on removal but that's
different.).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
