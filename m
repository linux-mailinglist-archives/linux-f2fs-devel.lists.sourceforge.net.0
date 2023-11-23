Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9F7F6453
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 17:44:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6Cop-0006WA-4s;
	Thu, 23 Nov 2023 16:44:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gabriel@krisman.be>) id 1r6Con-0006W4-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 16:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AF/KeTYKhpfCXHeZPKV/bfK4ZedFWe4v+4JbDSSxA/I=; b=DotDRdODU0C2xEEvJ4SP7c5jGH
 w4dKGXnCDUI8lbe7wfgqruaeU49NoOsAsfhpdgEwIgwPyYEYQP/9yng2grzC7zHsBDvkAsSwAOH93
 paa68rgJLltXz9muCF4t2hYuh2uCC3DX0wcD92OCOo5efBoQuEQsrK7vy0WYpmlbjFg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AF/KeTYKhpfCXHeZPKV/bfK4ZedFWe4v+4JbDSSxA/I=; b=h1pvRshydt4/GN821oEP4svR3o
 TmwR9wPbzlUISYJ8QWhSsx3g7qezZkb3XJrdOQc41oyRdMg1qWo1BIR7bb8vAq93dtfSlnDKvRCGl
 dShcHPss/jMdu2dewq6a8hJD5YzPs84cEu+YdAxGZtANRQe8t6Z7i0tyrYJ5/+OxWRJo=;
Received: from mslow1.mail.gandi.net ([217.70.178.240])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6Coi-00DhUK-7P for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 16:44:45 +0000
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4AF46C865E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Nov 2023 15:57:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB541FF80E;
 Thu, 23 Nov 2023 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=gm1;
 t=1700755045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AF/KeTYKhpfCXHeZPKV/bfK4ZedFWe4v+4JbDSSxA/I=;
 b=XuFA093obwvK280z2xdg/19K6D/WCU59rHBphQqXJKjTAerzfphmIVx2tgwSaX1foGUnUm
 IMBNRrJmqIWb/SHxkiiFDzdUI2OrpBu7wqbrFYcJHVDO4QE2+VNyKDH1H9BvGP92WknY52
 QcZnKu7liRTfyqh602spjR3aTmutaA88Wy1dzP8pe8B1GTgqXqN3Cbc8K6jZcOW9aQ0Lsk
 vZ/IXL2cVYJ4IiB3pdRoQLySmvbb2pyqXG24xOMNRQigPoLJk4lcgtTTRpF2julehI8Epv
 CkezQN76OWICUNRDvmrG3fWh0/ZWpOgMHPlX93cSWBdem9Nq9Fsetqxm88LI2Q==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 (Linus Torvalds's message of "Wed, 22 Nov 2023 16:18:56 -0800")
Organization: SUSE
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
Date: Thu, 23 Nov 2023 10:57:22 -0500
Message-ID: <87o7fkihst.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-GND-Sasl: gabriel@krisman.be
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Linus Torvalds <torvalds@linux-foundation.org> writes: > Side
 note: Gabriel, as things are now,
 instead of that > > if (!d_is_casefolded_name(dentry))
 > return 0; > > in generic_ci_d_revalidate(), I would suggest that any time
 a > directory is turned into [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [217.70.178.240 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
X-Headers-End: 1r6Coi-00DhUK-7P
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Linus Torvalds <torvalds@linux-foundation.org> writes:

> Side note: Gabriel, as things are now, instead of that
>
>         if (!d_is_casefolded_name(dentry))
>                 return 0;
>
> in generic_ci_d_revalidate(), I would suggest that any time a
> directory is turned into a case-folded one, you'd just walk all the
> dentries for that directory and invalidate negative ones at that
> point. Or was there some reason I missed that made it a good idea to
> do it at run-time after-the-fact?
>

The problem I found with that approach, which I originally tried, was
preventing concurrent lookups from racing with the invalidation and
creating more 'case-sensitive' negative dentries.  Did I miss a way to
synchronize with concurrent lookups of the children of the dentry?  We
can trivially ensure the dentry doesn't have positive children by
holding the parent lock, but that doesn't protect from concurrent
lookups creating negative dentries, as far as I understand.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
