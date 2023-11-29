Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A987FDB06
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Nov 2023 16:20:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8MMM-0006xP-JP;
	Wed, 29 Nov 2023 15:20:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiederm@xmission.com>) id 1r8MML-0006xJ-8L
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 15:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U6c0fq7KFsncZZz+YJTsa8Nv4i5aeZP+Zi7973oKj+E=; b=LiRy0V/ciQaQXzpH8DbmUQMX5W
 JJ0AfJ+Sa1NXSeyBOEb7mFj9PQq73X53rMFI4qcOIRF16EWWBJMEfviXIE1asGBVN+RSTA4AO6vWj
 MgjcAYXkGRlJPbH5a85bNtlEuncrssWkj8bZU6G+6zv+s2p5mllaf851nrDyM4O7+zLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U6c0fq7KFsncZZz+YJTsa8Nv4i5aeZP+Zi7973oKj+E=; b=HlygeGc0hX548EayazAS+rcbTn
 lU+cRwtJrY8OPVL2udj4hSHcBxQ2Z2DaB7YlR8FOPOvnWiJIE0EU4AYju0UF6J6kMf+7NT22Tohd5
 R6IHJzvqwG0edqfMtVqyrTOLUtT7SPEp0J4TjdON1Yk0uFy98jUJE9VUNgaMeV2dJCVI=;
Received: from out01.mta.xmission.com ([166.70.13.231])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8MME-0004Mh-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 15:20:15 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:41778)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r8MLv-00Cf3p-Sp; Wed, 29 Nov 2023 08:19:51 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:49158
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r8MLu-005gWB-Nk; Wed, 29 Nov 2023 08:19:51 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Al Viro <viro@zeniv.linux.org.uk>
In-Reply-To: <20231129045313.GA1130947@ZenIV> (Al Viro's message of "Wed, 29
 Nov 2023 04:53:13 +0000")
References: <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <20231125220136.GB38156@ZenIV>
 <20231126045219.GD38156@ZenIV> <20231126184141.GF38156@ZenIV>
 <20231127063842.GG38156@ZenIV> <20231129045313.GA1130947@ZenIV>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 29 Nov 2023 09:19:41 -0600
Message-ID: <87v89kio36.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
X-XM-SPF: eid=1r8MLu-005gWB-Nk; ; ;
 mid=<87v89kio36.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.168.167; ; ;
 frm=ebiederm@xmission.com; ; ; spf=pass
X-XM-AID: U2FsdGVkX1/b6JS6EkjAv/7bqf1Ls+CX0i6iy1ZrEtE=
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
X-Spam-Timing: total 555 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 11 (2.0%), b_tie_ro: 10 (1.8%), parse: 1.33
 (0.2%), extract_message_metadata: 18 (3.2%), get_uri_detail_list: 3.1
 (0.6%), tests_pri_-2000: 12 (2.2%), tests_pri_-1000: 3.6 (0.6%),
 tests_pri_-950: 1.52 (0.3%), tests_pri_-900: 1.28 (0.2%),
 tests_pri_-90: 133 (23.9%), check_bayes: 130 (23.5%), b_tokenize: 8
 (1.5%), b_tok_get_all: 69 (12.5%), b_comp_prob: 5 (0.9%),
 b_tok_touch_all: 44 (7.8%), b_finish: 0.86 (0.2%), tests_pri_0: 354
 (63.8%), check_dkim_signature: 0.65 (0.1%), check_dkim_adsp: 2.8
 (0.5%), poll_dns_idle: 0.80 (0.1%), tests_pri_10: 3.1 (0.6%),
 tests_pri_500: 12 (2.2%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Al Viro <viro@zeniv.linux.org.uk> writes: > On Mon, Nov 27, 
 2023 at 06:38:43AM +0000, Al Viro wrote: > >> > FWIW, I suspect that the
 right answer would be along the lines of >> > * if d_splice_alias() does move
 an exsiting (attached) alias in [...] 
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
X-Headers-End: 1r8MME-0004Mh-UJ
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

> On Mon, Nov 27, 2023 at 06:38:43AM +0000, Al Viro wrote:
>
>> > FWIW, I suspect that the right answer would be along the lines of
>> > 	* if d_splice_alias() does move an exsiting (attached) alias in
>> > place, it ought to dissolve all mountpoints in subtree being moved.
>> > There might be subtleties,
>
> Are there ever...  Starting with the "our test for loop creation
> (alias is a direct ancestor, need to fail with -ELOOP) is dependent
> upon rename_lock being held all along".
>
> Folks, what semantics do we want for dissolving mounts on splice?
> The situation when it happens is when we have a subtree on e.g. NFS
> and have some mounts (on client) inside that.  Then somebody on
> server moves the root of that subtree somewhere else and we try
> to do a lookup in new place.  Options:
>
> 1) our dentry for directory that got moved on server is moved into
> new place, along with the entire subtree *and* everything mounted
> on it.  Very dubious semantics, especially since if we look the
> old location up before looking for new one, the mounts will be
> dissolved; no way around that.
>
> 2) lookup fails.  It's already possible; e.g. if server has
> /srv/nfs/1/2/3 moved to /srv/nfs/x, then /srv/nfs/1/2 moved
> to /srv/nfs/x/y and client has a process with cwd in /mnt/nfs/1/2/3
> doing a lookup for "y", there's no way in hell to handle that -
> the lookup will return the fhandle of /srv/nfs/x, which is the
> same thing the client has for /mnt/nfs/1/2; we *can't* move that
> dentry to /mnt/nfs/1/2/3/y - not without creating a detached loop.
> We can also run into -ESTALE if one of the trylocks in
> __d_unalias() fails.  Having the same happen if there are mounts
> in the subtree we are trying to splice would be unpleasant, but
> not fatal.  The trouble is, that won't be a transient failure -
> not until somebody tries to look the old location up.
>
> 3) dissolve the mounts.  Doable, but it's not easy; especially
> since we end up having to redo the loop-prevention check after
> the mounts had been dissolved.  And that check may be failing
> by that time, with no way to undo that dissolving...

To be clear this is a change in current semantics and has a minuscule
change of resulting in a regression.  That should be called out in the
change log.

If we choose to change the semantics I would suggest that the new
semantics be:

If a different name for a directory already exists:
	* Detach the mounts unconditionally (leaving dentry descendants alone).
	* Attempt the current splice.
          - If the splice succeeds ( return the new dentry )
	  - If the splice fails ( fail the lookup, and d_invalidate the existing name )

Unconditionally dissolving the mounts before attempting the rename
should simplify everything.

In the worst case a race between d_invalidate and d_splice_alias will
now become a race to see who can detach the mounts first.

Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
