Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C02BB7F66EE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 20:07:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6F2W-0001kr-IW;
	Thu, 23 Nov 2023 19:07:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gabriel@krisman.be>) id 1r6F2V-0001kh-2T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 19:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDXbPwWFJuD//zN6fX5C4MbLAREp00KDAGauJPXX/nA=; b=hoHqBbOGxMkZ77BtIXWVoYhxjU
 5W5B2au5J5Q3fdf8dDqnJR25UyV+e0pQJs2VQqpwugQ2J6GPgcFvHbsVpOta9EkioApPBu1MjiAZf
 dMQCGjwUcnq/hsD+PFOTqIEAJAxnT6AIQP4c9W/aT6BWUklvRqWJy4WxHo8NkvzzVAYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uDXbPwWFJuD//zN6fX5C4MbLAREp00KDAGauJPXX/nA=; b=I6w0yQrz66dL2J8KwujYGRbp2w
 Q6sDB8TqznBroaAQdbaBYkzI/7qE6+SyLN8sZ373N+pbRjZbHai3qiTV/KDTtfVUFkDfzVzyzrx+G
 3S6rfGN3lxr4RuDyl97eyFtPUP4dzQplC1prCxu/0s48ugdv/xAtzgdTeV18fFXlMGTY=;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6F2O-00DmMq-Md for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 19:07:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3D62E0004;
 Thu, 23 Nov 2023 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=gm1;
 t=1700766408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDXbPwWFJuD//zN6fX5C4MbLAREp00KDAGauJPXX/nA=;
 b=fsUH7EkvMY8tJycvoSELkAmUl6MVnc0PCQKAtetqwIZ4oxZRr1YpCrPhtUqrZ+A0/RWp6Q
 3w1KYkDlVXjAJGhXIpr0P7swmTKMfX9MoWAmcey2Z9j+n7eTJyM6848RxMFi6Nje5kjoGo
 yADLk1EaOapkr7pBS4f0uccThKtcPbDBibIXz1gcOVtVmugTsz+w3kxEoB0y73gCnsrcIE
 Ck3TvVx5kbxLZXBF5IpTrWP3HtyiudNQDftBhWt2FVSpTeyOFrvDLEtp4/bfnfGxw5yB1N
 0Nh5L2i0QE26gjXIswrUQnpm4aJ9JBJUXA1KF/13L55DcCEvP7LnNLZd4sk9ZQ==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Al Viro <viro@zeniv.linux.org.uk>
In-Reply-To: <20231123182426.GO38156@ZenIV> (Al Viro's message of "Thu, 23 Nov
 2023 18:24:26 +0000")
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
Date: Thu, 23 Nov 2023 14:06:39 -0500
Message-ID: <87bkbki91c.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-GND-Sasl: gabriel@krisman.be
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Al Viro <viro@zeniv.linux.org.uk> writes: > On Thu, Nov 23, 
 2023 at 12:37:43PM -0500, Gabriel Krisman Bertazi wrote: >> > That's the
 problem I'd been talking about - there is a class of situations >> > where
 the work done by ext4_lookup() to [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [217.70.183.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [217.70.183.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
X-Headers-End: 1r6F2O-00DmMq-Md
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
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Thu, Nov 23, 2023 at 12:37:43PM -0500, Gabriel Krisman Bertazi wrote:
>> > That's the problem I'd been talking about - there is a class of situations
>> > where the work done by ext4_lookup() to set the state of dentry gets
>> > completely lost.  After lookup you do have a dentry in the right place,
>> > with the right name and inode, etc., but with NULL
>> > ->d_op->d_revalidate.
>> 
>> I get the problem now. I admit to not understanding all the details yet,
>> which is why I haven't answered directly, but I understand already how
>> it can get borked.  I'm studying your explanation.
>> 
>> Originally, ->d_op could be propagated trivially since we had sb->s_d_op
>> set, which would be set by __d_alloc, but that is no longer the case
>> since we combined fscrypt and CI support.
>>
>> What I still don't understand is why we shouldn't fixup ->d_op when
>> calling d_obtain_alias (before __d_instantiate_anon) and you say we
>> better do it in d_splice_alias.  The ->d_op is going to be the same
>> across the filesystem when the casefold feature is enabled, regardless
>> if the directory is casefolded.  If we set it there, the alias already
>> has the right d_op from the start.
>
> *blink*
>
> A paragraph above you've said that it's not constant over the entire
> filesystem.

The same ->d_op is used by every dentry in the filesystem if the superblock
has the casefold bit enabled, regardless of whether a specific inode is
casefolded or not. See generic_set_encrypted_ci_d_ops in my tree. It is
called unconditionally by ext4_lookup and only checks the superblock:

void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
{
        if (dentry->d_sb->s_encoding) {
		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
		return;
	}
        ...

What I meant was that this used to be set once at sb->s_d_op, and
propagated during dentry allocation.  Therefore, the propagation to the
alias would happen inside __d_alloc.  Once we enabled fscrypt and
casefold to work together, sb->s_d_op is NULL and we always set the same
handler for every dentry during lookup.

> Look, it's really simple - any setup work of that sort done in ->lookup()
> is either misplaced, or should be somehow transferred over to the alias
> if one gets picked.
>
> As for d_obtain_alias()... AFAICS, it's far more limited in what information
> it could access.  It knows the inode, but it has no idea about the parent
> to be.

Since it has the inode, d_obtain_alias has the superblock.  I think that's all
we need for generic_set_encrypted_ci_d_ops.

> The more I look at that, the more it feels like we need a method that would
> tell the filesystem that this dentry is about to be spliced here.  9p is
> another place where it would obviously simplify the things; ocfs2 'attach
> lock' stuff is another case where the things get much more complicated
> by having to do that stuff after splicing, etc.
>
> It's not even hard to do:
>
> 1. turn bool exchange in __d_move() arguments into 3-value thing - move,
> exchange or splice.  Have the callers in d_splice_alias() and __d_unalias()
> pass "splice" instead of false (aka normal move).
>
> 2. make __d_move() return an int (normally 0)
>
> 3. if asked to splice and if there's target->d_op->d_transfer(), let
> __d_move() call it right after
>         spin_lock_nested(&dentry->d_lock, 2);
> 	spin_lock_nested(&target->d_lock, 3);
> in there.  Passing it target and dentry, obviously.  In unlikely case
> of getting a non-zero returned by the method, undo locks and return
> that value to __d_move() caller.
>
> 4. d_move() and d_exchange() would ignore the value returned by __d_move();
> __d_unalias() turn
>         __d_move(alias, dentry, false);
> 	ret = 0;
> into
> 	ret = __d_move(alias, dentry, Splice);
> d_splice_alias() turn
> 				__d_move(new, dentry, false);
> 				write_sequnlock(&rename_lock);
> into
> 				err = __d_move(new, dentry, Splice);
> 				write_sequnlock(&rename_lock);
> 				if (unlikely(err)) {
> 					dput(new);
> 					new = ERR_PTR(err);
> 				}
> (actually, dput()-on-error part would be common to all 3 branches
> in there, so it would probably get pulled out of that if-else if-else).
>
> I can cook a patch doing that (and convert the obvious beneficiaries already
> in the tree to it) and throw it into dcache branch - just need to massage
> the series in there for repost...

if you can write that, I'll definitely appreciate it. It will surely
take me much longer to figure it out myself.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
