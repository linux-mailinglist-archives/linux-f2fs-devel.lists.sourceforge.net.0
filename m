Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA07F3C70
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Nov 2023 04:31:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5dxY-0000SX-8e;
	Wed, 22 Nov 2023 03:31:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1r5dxC-0000Rs-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 03:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BhZP3qEN5hsXOI+Bp57hPO+d5fX5NnExSd4UjG1PjK0=; b=R/FCAjhwdGbiYqt2V5Px8xxzwI
 z1eBn5eCZEaFINohWJ41gZRGj87HWOPV9iGvcEc+QbQq/cZIoSqwKAzl02nhZOoVoHdVWm9iSv2zJ
 CddwLH+0T+hl9NgZqDzfPdtOsP9Tnphvun4DiMdZ9taPrsfvNtF2QPGj4oe8r/KURpT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BhZP3qEN5hsXOI+Bp57hPO+d5fX5NnExSd4UjG1PjK0=; b=XSjxzpQmjUrZemysEiR5/z1vT0
 BjqgE7yLI5wGGKmGQPcmz7oqn0z9uewbgKBdLlDRovlkutv0zeusoOYnjHUCIa91grmMpe4LYl+hU
 IhZrzc/+ukr+0FIm3gdKDDTEBmyfy6XfwXfakO5SXNChITujSMgrCBxyoNY0oPd9yeuI=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r5dx5-00CQue-5a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 03:31:05 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E38921902;
 Wed, 22 Nov 2023 03:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700623850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BhZP3qEN5hsXOI+Bp57hPO+d5fX5NnExSd4UjG1PjK0=;
 b=tE5iZcyvpDJXrk4EMR1l7tshsDoLgLOp1XYwmeG5BE5CHJqY5yWUfEyBLV9oGP+aHAf2Zx
 U7KWtg5ssahJzKrdzmYArZYW8W4B/DemWzXIEG9b/Jlvl0JHJW7MSgfCW8QzFzbFEadyPM
 vxcoXvlbYMz8PVtu3+5EjvbFRwpqYe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700623850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BhZP3qEN5hsXOI+Bp57hPO+d5fX5NnExSd4UjG1PjK0=;
 b=vQmPx+3OBCzUQ+5Vejd5XURbHHQ8aXbFJ+2/4uLefxMe5Gjc/p3FikKIZ00Bj+szqEynRk
 +H55dv1rJeDxwyBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F185C13461;
 Wed, 22 Nov 2023 03:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sgt+Nel1XWXyWwAAMHmgww
 (envelope-from <krisman@suse.de>); Wed, 22 Nov 2023 03:30:49 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 (Linus Torvalds's message of "Mon, 20 Nov 2023 10:07:51 -0800")
Organization: SUSE
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
Date: Tue, 21 Nov 2023 22:30:48 -0500
Message-ID: <87zfz6jwgn.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.99
X-Spamd-Result: default: False [0.99 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_SPAM_SHORT(2.89)[0.964]; HAS_ORG_HEADER(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; INVALID_MSGID(1.70)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Linus Torvalds <torvalds@linux-foundation.org> writes: > I
 dislike case folding with a passion - it's about the worst design > decision
 a filesystem can ever do - but the other side of that is that > if you have
 to have case folding, the last thing you wa [...] 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5dx5-00CQue-5a
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
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Linus Torvalds <torvalds@linux-foundation.org> writes:

> I dislike case folding with a passion - it's about the worst design
> decision a filesystem can ever do - but the other side of that is that
> if you have to have case folding, the last thing you want to do is to
> have each filesystem deal with that sh*t-for-brains decision itself.

Thanks for pitching in.

We all agree it is a horrible feature that we support for very specific
use cases.  I'm the one who added the code, yes, but I was never
under the illusion it's a good feature.  It solely exists to let Linux
handle the bad decisions made elsewhere.

> So moving more support for case folding into the VFS so that the
> horrid thing at least gets better support is something I'm perfectly
> fine with despite my dislike of it.

Yes. The entire implementation was meant to stay as far away as possible
from the fast lookup path (didn't want to displease Viro).  The negative
dentry is the only exception that required more changes to vfs to
address the issue he found of dangling negative dentries when turning a
directory case-insensitive.

But, fyi, there is work in progress to add support to more filesystems.
This is why I really want to get all of this done first. There is a use
case to enable it in shmem because of containerized environments
running wine; I was recently cc'ed on a bcachefs implementation; and
there are people working on adding it to btrfs (to support wine in
specific products).

> Of course, "do it in shared generic code" doesn't tend to really fix
> the braindamage, but at least it's now shared braindamage and not
> spread out all over. I'm looking at things like
> generic_ci_d_compare(), and it hurts to see the mindless "let's do
> lookups and compares one utf8 character at a time". What a disgrace.
> Somebody either *really* didn't care, or was a Unicode person who
> didn't understand the point of UTF-8.

Yes. I saw the rest of the thread and you are obviously correct here.
It needs to be fixed.  I will follow up with patches.

> The patches look fine to me. Al - do you even care about them?

I saw that Al Viro answered. Thank you, Al. So I'll wait for either his
review or the merge window.

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
