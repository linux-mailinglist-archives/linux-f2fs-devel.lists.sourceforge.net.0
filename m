Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B97FA8D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 19:20:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7gD3-0007bz-1T;
	Mon, 27 Nov 2023 18:19:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiederm@xmission.com>) id 1r7gCz-0007bs-OE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 18:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTNE62q3DxNKqDFJ6wgwV/9bcJ77U8erM8cnCDOi+3E=; b=CvEk4PRUDKWiH5pgC4/3no/gYh
 TzHx/MDad58Thwe7CmDC3nvb+nFaUYJfUZP13mhprfg3o82gT6doTuV2oi1RDtpCSRooHfYBgwA3q
 CN397UOvb/hqxgS6cQk4iJsKtqptHzbIbfMhyQbP68s29uZvLgef/UPzEQHMydmUifiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTNE62q3DxNKqDFJ6wgwV/9bcJ77U8erM8cnCDOi+3E=; b=Mp5R31zR1KwPVxht15WMIlSwOT
 n6uBHHVexN2owb8pTQTnuCJ4K/XUZ0rEt/aKpkWF+rhkMRMKRyw4Xrlb7O1KhpK2mP5fii4Tzcvl2
 DgOpI8eDI76hoo4kphDdLtWg4sFnlGx5ycroOjWfxQqUPTKroBsDtbx8yeUVLAIsbZZ8=;
Received: from out01.mta.xmission.com ([166.70.13.231])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7gCz-0000Dr-2U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 18:19:50 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:44548)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r7gCp-007QBU-6v; Mon, 27 Nov 2023 11:19:39 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:58050
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r7gCo-006hy6-31; Mon, 27 Nov 2023 11:19:38 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Al Viro <viro@zeniv.linux.org.uk>
References: <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <20231125220136.GB38156@ZenIV>
 <20231126045219.GD38156@ZenIV> <20231126184141.GF38156@ZenIV>
 <20231127063842.GG38156@ZenIV>
 <87jzq3nqos.fsf@email.froward.int.ebiederm.org>
 <20231127160318.GI38156@ZenIV> <20231127161426.GA964333@ZenIV>
Date: Mon, 27 Nov 2023 12:19:09 -0600
In-Reply-To: <20231127161426.GA964333@ZenIV> (Al Viro's message of "Mon, 27
 Nov 2023 16:14:26 +0000")
Message-ID: <87v89nkqjm.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1r7gCo-006hy6-31; ; ;
 mid=<87v89nkqjm.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.168.167; ; ;
 frm=ebiederm@xmission.com; ; ; spf=pass
X-XM-AID: U2FsdGVkX18q4nSddb4xv1hV6x7/Ii/Wh0OYvIlQsaU=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
 T_TooManySym_01,T_TooManySym_02,T_TooManySym_03,T_TooManySym_04,
 T_TooManySym_05,XMSubLong,XM_B_SpammyWords autolearn=disabled
 version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.0 T_TooManySym_05 8+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_04 7+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Relay-Country: 
X-Spam-Timing: total 544 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 12 (2.3%), b_tie_ro: 11 (1.9%), parse: 1.80
 (0.3%), extract_message_metadata: 23 (4.2%), get_uri_detail_list: 4.2
 (0.8%), tests_pri_-2000: 15 (2.8%), tests_pri_-1000: 11 (2.0%),
 tests_pri_-950: 1.84 (0.3%), tests_pri_-900: 1.23 (0.2%),
 tests_pri_-90: 87 (16.0%), check_bayes: 84 (15.4%), b_tokenize: 11
 (2.0%), b_tok_get_all: 10 (1.8%), b_comp_prob: 3.8 (0.7%),
 b_tok_touch_all: 54 (9.9%), b_finish: 1.39 (0.3%), tests_pri_0: 369
 (67.9%), check_dkim_signature: 0.71 (0.1%), check_dkim_adsp: 3.5
 (0.6%), poll_dns_idle: 1.04 (0.2%), tests_pri_10: 2.2 (0.4%),
 tests_pri_500: 13 (2.4%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Al Viro <viro@zeniv.linux.org.uk> writes: > On Mon, Nov 27, 
 2023 at 04:03:18PM +0000, Al Viro wrote: >> On Mon, Nov 27, 2023 at 09:47:47AM
 -0600, Eric W. Biederman wrote: >> >> > There is a lot going on there. I
 remember one of the relevant > [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [166.70.13.231 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [166.70.13.231 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7gCz-0000Dr-2U
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

> On Mon, Nov 27, 2023 at 04:03:18PM +0000, Al Viro wrote:
>> On Mon, Nov 27, 2023 at 09:47:47AM -0600, Eric W. Biederman wrote:
>> 
>> > There is a lot going on there.  I remember one of the relevant
>> > restrictions was marking dentries dont_mount, and inodes S_DEAD
>> > in unlink and rmdir.
>> > 
>> > But even without out that marking if d_invalidate is called
>> > from d_revalidate the inode and all of it's dentries must be
>> > dead because the inode is stale and most go.  There should
>> > be no resurrecting it at that point.
>> > 
>> > I suspect the most fruitful way to think of the d_invalidate vs
>> > d_splice_alias races is an unlink vs rename race.
>> > 
>> > I don't think the mechanism matters, but deeply and fundamentally
>> > if we detect a directory inode is dead we need to stick with
>> > that decision and not attempt to resurrect it with d_splice_alias.
>> 
>> Wrong.  Deeply and fundamentally we detect a dentry that does not
>> match the directory contents according to the server.
>> 
>> For example, due to rename done on server.  With object in question
>> perfectly alive there - fhandle still works, etc.
>> 
>> However, it's no longer where it used to be.  And we would bloody better
>> not have lookups for the old name result in access to that object.
>> We also should never allow the access to *new* name lead to two live
>> dentries for the same directory inode.
>> 
>> Again, this is not about rmdir() or unlink() - invalidation can happen
>> for object that is still open, still accessed and still very much alive.
>> Does that all the time for any filesystem with ->d_revalidate().
>
> Put another way, there used to be very odd song and dance in ->d_revalidate()
> instances along the lines of "we can't possibly tell the caller to invalidate
> a mountpoint"; it was racy in the best case and during the rewrite of
> d_invalidate() to teach it how to evict submounts those attempts had been
> dropped - ->d_revalidate() returning 0 does end up with mounts dissolved
> by d_invalidate() from caller.
>
> It always had been racy, starting with the checks that used to be in
> ->d_revalidate() instances way before all those changes.  So the switch
> of d_invalidate() to dissolving submounts had been a step in the right
> direction, but it's not being careful enough.
>
> Again, it's about d_invalidate() caused by pathwalk running into a dentry that
> doesn't match the reality vs. d_splice_alias() finding that it matches the
> inode we had looked up elsewhere.

My point is we should have a atomic way to decide the disposition of
such a dentry, and it's children.

Either we should decide it is useless and remove it and all of it's
children.

Or we should decide it was renamed and just handle it that way.

If we can record such a decision on the dentry or possibly on the inode
then we can resolve the race by having it be a proper race of which
comes first.

It isn't a proper delete of the inode so anything messing with the inode
and marking it S_DEAD is probably wrong.

The code could do something like mark the dentry dont_mount which should
be enough to for d_splice_alias to say oops, something is not proper
here.  Let the d_invalidate do it's thing.

Or the code could remove the dentry from inode->i_dentry and keep
d_splice alias from finding it, and it's children completely.
That is different from unhashing it.

Anyway that is my memory and my general sense of what is going on.
I help it helps.

Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
