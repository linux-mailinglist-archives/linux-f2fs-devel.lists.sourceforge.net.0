Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 250207FA59F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 17:06:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7e7k-0002EP-0O;
	Mon, 27 Nov 2023 16:06:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiederm@xmission.com>) id 1r7e7Y-0002EH-4L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 16:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F2XVjYS15DnBKDYgdZ6Dy2/Nx0q+9aIsAG5Ok1ftBM8=; b=ciUuW1wbAJ5zBS5ARHH6uCoEwy
 7SwrRQlpjfLBb3WrwPUZFbbxE38j1SmZDVFKJBXMbE0O+pXENm/JBKaV4Mdc0NXciGwabkKofpuH9
 PZB5fFXbPiHRsIXtlgV1u3Mo499N757bdXTb/l1hrRIhmYe1Agp2SZ2mWkMB5xPEzUqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F2XVjYS15DnBKDYgdZ6Dy2/Nx0q+9aIsAG5Ok1ftBM8=; b=RjbOGSzrceNbEc+Pz4HD3cgJ8j
 8KOp4+WU0na50e6zf7Liuo6Zy9wh78b8kKePUzPYwI4dtfw1JmR5qpHHwSmsgN0F1bcqgoP3mjFBN
 ++XWwtP+BPUAdLkV5NSFFoqEGZmaEWLwqAhPwLtSVvOQCiqwscIWFLWFbILxdK8QoYEk=;
Received: from out03.mta.xmission.com ([166.70.13.233])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7e7U-00H7ej-HZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 16:06:04 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:45924)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r7dqH-0037sg-6R; Mon, 27 Nov 2023 08:48:13 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:47674
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r7dqF-001Jou-Tb; Mon, 27 Nov 2023 08:48:12 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <20231125220136.GB38156@ZenIV>
 <20231126045219.GD38156@ZenIV> <20231126184141.GF38156@ZenIV>
 <20231127063842.GG38156@ZenIV>
Date: Mon, 27 Nov 2023 09:47:47 -0600
In-Reply-To: <20231127063842.GG38156@ZenIV> (Al Viro's message of "Mon, 27 Nov
 2023 06:38:42 +0000")
Message-ID: <87jzq3nqos.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1r7dqF-001Jou-Tb; ; ;
 mid=<87jzq3nqos.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.168.167; ; ;
 frm=ebiederm@xmission.com; ; ; spf=pass
X-XM-AID: U2FsdGVkX19Ivoqmgj6NYRmk04vHCeMgMvlWWNyi8uM=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa02.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
 T_TooManySym_01,T_TooManySym_02,T_TooManySym_03,T_TooManySym_04,
 T_TooManySym_05,T_XMDrugObfuBody_08,XMSubLong,XM_Body_Dirty_Words
 autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4999] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
 *  1.0 XM_Body_Dirty_Words Contains a dirty word
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  1.0 T_XMDrugObfuBody_08 obfuscated drug references
 *  0.0 T_TooManySym_04 7+ unique symbols in subject
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
 *  0.0 T_TooManySym_05 8+ unique symbols in subject
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Relay-Country: 
X-Spam-Timing: total 655 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.8 (0.7%), b_tie_ro: 3.4 (0.5%), parse: 1.41
 (0.2%), extract_message_metadata: 15 (2.2%), get_uri_detail_list: 5
 (0.8%), tests_pri_-2000: 8 (1.2%), tests_pri_-1000: 1.97 (0.3%),
 tests_pri_-950: 0.94 (0.1%), tests_pri_-900: 0.79 (0.1%),
 tests_pri_-90: 70 (10.8%), check_bayes: 69 (10.5%), b_tokenize: 11
 (1.6%), b_tok_get_all: 14 (2.1%), b_comp_prob: 4.7 (0.7%),
 b_tok_touch_all: 37 (5.6%), b_finish: 0.77 (0.1%), tests_pri_0: 540
 (82.4%), check_dkim_signature: 0.45 (0.1%), check_dkim_adsp: 7 (1.1%),
 poll_dns_idle: 6 (0.9%), tests_pri_10: 1.82 (0.3%), tests_pri_500: 7
 (1.1%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Al Viro <viro@zeniv.linux.org.uk> writes: > On Sun, Nov 26, 
 2023 at 06:41:41PM +0000, Al Viro wrote: > >> d_invalidate() situation is
 more subtle - we need to sort out its interplay >> with d_splice_alias().
 >> >> More concise variant of the [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [166.70.13.233 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7e7U-00H7ej-HZ
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Sun, Nov 26, 2023 at 06:41:41PM +0000, Al Viro wrote:
>
>> d_invalidate() situation is more subtle - we need to sort out its interplay
>> with d_splice_alias().
>> 
>> More concise variant of the scenario in question:
>> * we have /mnt/foo/bar and a lot of its descendents in dcache on client
>> * server does a rename, after which what used to be /mnt/foo/bar is /mnt/foo/baz
>> * somebody on the client does a lookup of /mnt/foo/bar and gets told by
>> the server that there's no directory with that name anymore.
>> * that somebody hits d_invalidate(), unhashes /mnt/foo/bar and starts
>> evicting its descendents
>> * We try to mount something on /mnt/foo/baz/blah.  We look up baz, get
>> an fhandle and notice that there's a directory inode for it (/mnt/foo/bar).
>> d_splice_alias() picks the bugger and moves it to /mnt/foo/baz, rehashing
>> it in process, as it ought to.  Then we find /mnt/foo/baz/blah in dcache and 
>> mount on top of it.
>> * d_invalidate() finishes shrink_dcache_parent() and starts hunting for
>> submounts to dissolve.  And finds the mount we'd done.  Which mount quietly
>> disappears.
>> 
>> Note that from the server POV the thing had been moved quite a while ago.
>> No server-side races involved - all it seeem is a couple of LOOKUP in the
>> same directory, one for the old name, one for the new.
>> 
>> On the client on the mounter side we have an uneventful mount on /mnt/foo/baz,
>> which had been there on server at the time we started and which remains in
>> place after mount we'd created suddenly disappears.
>> 
>> For the thread that ended up calling d_invalidate(), they'd been doing e.g.
>> stat on a pathname that used to be there a while ago, but currently isn't.
>> They get -ENOENT and no indication that something odd might have happened.
>> 
>> >From ->d_revalidate() point of view there's also nothing odd happening -
>> dentry is not a mountpoint, it stays in place until we return and there's
>> no directory entry with that name on in its parent.  It's as clear-cut
>> as it gets - dentry is stale.
>> 
>> The only overlap happening there is d_splice_alias() hitting in the middle
>> of already started d_invalidate().
>> 
>> For a while I thought that ff17fa561a04 "d_invalidate(): unhash immediately"
>> and 3a8e3611e0ba "d_walk(): kill 'finish' callback" might have something
>> to do with it, but the same problem existed prior to that.
>> 
>> FWIW, I suspect that the right answer would be along the lines of
>> 	* if d_splice_alias() does move an exsiting (attached) alias in
>> place, it ought to dissolve all mountpoints in subtree being moved.
>> There might be subtleties, but in case when that __d_unalias() happens
>> due to rename on server this is definitely the right thing to do.
>> 	* d_invalidate() should *NOT* do anything with dentry that
>> got moved (including moved by d_splice_alias()) from the place we'd
>> found it in dcache.  At least d_invalidate() done due to having
>> ->d_revalidate() return 0.
>> 	* d_invalidate() should dissolve all mountpoints in the
>> subtree that existed when it got started (and found the victim
>> still unmoved, that is).  It should (as it does) prevent any
>> new mountpoints added in that subtree, unless the mountpoint
>> to be had been moved (spliced) out.  What it really shouldn't
>> do is touch the mountpoints that are currently outside of it
>> due to moves.
>> 
>> I'm going to look around and see if we have any weird cases where
>> d_splice_alias() is used for things like "correct the case of
>> dentry name on a case-mangled filesystem" - that would presumably
>> not want to dissolve any submounts.  I seem to recall seeing
>> some shite of that sort, but that was a long time ago.
>> 
>> Eric, Miklos - it might be a good idea if you at least took a
>> look at whatever comes out of that (sub)thread; I'm trying to
>> reconstruct the picture, but the last round of serious reworking
>> of that area had been almost 10 years ago and your recollections
>> of the considerations back then might help.  I realize that they
>> are probably rather fragmentary (mine definitely are) and any
>> analysis will need to be redone on the current tree, but...

By subthread I assume you are referring to the work to that generalized
check_submounts_and_drop into the current d_invalidate.

My memory is that there were deliberate restrictions on where
d_revalidate could be called so as not to mess with mounts.

I believe those restrictions either prevented or convinced us it
prevented nasty interactions between d_invalidate and d_splice_alias.

There is a lot going on there.  I remember one of the relevant
restrictions was marking dentries dont_mount, and inodes S_DEAD
in unlink and rmdir.

But even without out that marking if d_invalidate is called
from d_revalidate the inode and all of it's dentries must be
dead because the inode is stale and most go.  There should
be no resurrecting it at that point.

I suspect the most fruitful way to think of the d_invalidate vs
d_splice_alias races is an unlink vs rename race.


I don't think the mechanism matters, but deeply and fundamentally
if we detect a directory inode is dead we need to stick with
that decision and not attempt to resurrect it with d_splice_alias.


Looking at ext4 and f2fs it appears when case folding they are calling
d_invalidate before the generic code can, and before marking like
dont_mount happen.  Is that the tie in with where the current
conversation comes in?


> TBH, I wonder if we ought to have d_invalidate() variant that would
> unhash the dentry in question,

You mean like the current d_invalidate does?  It calls __d_drop which
unhashes the thing and prevent lookups.  You even pointed to the change
that added that in the previous email.  The only thing that does not
happen currently is marking the dentry as unhashed.

Looking the rmdir code uses not only dont_mount but marks the
inode S_DEAD as well.

Right now we can't even get to d_splice_alias unless the original
dentry is unhashed.

So I suspect it isn't d_invalidate you are fighting.

> do a variant of shrink_dcache_parent()
> that would report if there had been any mountpoints and if there
> had been any, do namespace_lock() and go hunting for mounts in that
> subtree, moving corresponding struct mountpoint to a private list
> as we go (removing them from mountpoint hash chains, that it).  Then
> have them all evicted after we'd finished walking the subtree...

>
> The tricky part will be lock ordering - right now we have the
> mountpoint hash protected by mount_lock (same as mount hash, probably
> worth splitting anyway) and that nests outside of ->d_lock.

I don't get get it.

All we have to do is to prevent the inode lookup from succeeding
if we have decided the inode has been deleted.  It may be a little
more subtle the path of the inode we are connecting goes through
a dentry that is being invalidated.

But either need to prevent it in the lookup that leads to d_alloc,
or prevent the new dentry from being attached.

I know d_splice_alias takes the rename_lock to prevent some of those
races.


I hope that helps on the recollection front.


I am confused what is going on with ext4 and f2fs.  I think they
are calling d_invalidate when all they need to call is d_drop.

Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
