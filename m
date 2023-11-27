Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4D7FA92C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 19:44:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7gag-0001Ku-9C;
	Mon, 27 Nov 2023 18:44:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r7gaf-0001JI-74
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 18:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tCivESMnwjC6Qdqm7yOK4or8gMne49Hy6vnOquUb2y0=; b=JuNNIY5FmW4hIch00faiWpZSAl
 bjBvZCF924WJIrZCYLk9qJwUwpvc+glgO3EE+Im4+UcK2VW30SDo01IhnPVfxGBujgKPQ3W8Sa7pJ
 UFg0rmnZhpFIh6Pt6/1JXfJ42+SLBD+L53nt/QN5+APMnW7eW7yvNy2bhzzht2TCr9Fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tCivESMnwjC6Qdqm7yOK4or8gMne49Hy6vnOquUb2y0=; b=ZmtsRpbV9zRerFasmKTVszQkst
 BOmUSy9szOKpjVM5I7fMQRylKuyRq+ISwl2gXguQ6b8sMaPHvY9ZENO2voIP+FJivjxZ3EpiL8Iw1
 BstHoy2BEe2BAdrrgZCaLMKbxho3c2x6i/hAD7T+HJ93lRW9QrVAVOGcZiyWMKgeMVrQ=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7gac-0001GF-Hg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 18:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tCivESMnwjC6Qdqm7yOK4or8gMne49Hy6vnOquUb2y0=; b=VK3TcR0XPvsokf+sip3MIrqtLy
 Z9PojGcz4u7KKhINZ4ZBo/PPmzi8I5yx2w6ajNCQrqS88RZyUWdqdeXDLluB0+ksYZEdBvzjSfJse
 M1NbZZLGLDFbcznZtzzDuPoErwI5csvP9RLxXfKKxWKFxXV7ZXSi5fe36HSArJLgfLEIKm5H0uO1D
 6xkhZfrvDDlOGRLdlHa+E290C45Y8qOo6dtxfHj6rbUk2PdCym42D+HKGXiwCnW/q4xIAHDsvBwIG
 9PAHTgHlskrUsj0Sl5Ynjh9QERJgZAZ6Rdom+A/+4TCsuw3aft/nM+nAS55rtfn//eF/3GIPuLP02
 aLAVeWwQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7gaK-00465D-0Y; Mon, 27 Nov 2023 18:43:56 +0000
Date: Mon, 27 Nov 2023 18:43:56 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <20231127184356.GK38156@ZenIV>
References: <20231123182426.GO38156@ZenIV> <20231123215234.GQ38156@ZenIV>
 <20231125220136.GB38156@ZenIV> <20231126045219.GD38156@ZenIV>
 <20231126184141.GF38156@ZenIV> <20231127063842.GG38156@ZenIV>
 <87jzq3nqos.fsf@email.froward.int.ebiederm.org>
 <20231127160318.GI38156@ZenIV> <20231127161426.GA964333@ZenIV>
 <87v89nkqjm.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v89nkqjm.fsf@email.froward.int.ebiederm.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 27, 2023 at 12:19:09PM -0600, Eric W. Biederman
 wrote: > Either we should decide it is useless and remove it and all of it's
 > children. > > Or we should decide it was renamed and just handle it that
 way. Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7gac-0001GF-Hg
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

On Mon, Nov 27, 2023 at 12:19:09PM -0600, Eric W. Biederman wrote:

> Either we should decide it is useless and remove it and all of it's
> children.
> 
> Or we should decide it was renamed and just handle it that way.

How?  An extra roundtrip to server trying to do getattr on the fhandle
we've got?

Cost of that aside, we *still* need to dissolve submounts in such case;
there is no warranty that we'll ever guess the new name and no way
to ask the server for one, so we can't let them sit around.  Not that
having mounts (local by definition) suddenly show up in the unexpected
place because of rename on server looks like a good thing, especially
since had that rename on server been done as cp -rl + rm -rf the same
mounts would be gone...
 
> If we can record such a decision on the dentry or possibly on the inode
> then we can resolve the race by having it be a proper race of which
> comes first.
> 
> It isn't a proper delete of the inode so anything messing with the inode
> and marking it S_DEAD is probably wrong.

s/probably/certainly/, but where would d_invalidate() do such a thing?
It's none of its business...

> The code could do something like mark the dentry dont_mount which should
> be enough to for d_splice_alias to say oops, something is not proper
> here.  Let the d_invalidate do it's thing.
> 
> Or the code could remove the dentry from inode->i_dentry and keep
> d_splice alias from finding it, and it's children completely.
> That is different from unhashing it.

We might be just in the middle of getdents(2) on the directory in question.
It can be opened; we can't do anything that destructive there.

Again, it's about the d_invalidate() on ->d_revalidate() reporting 0;
uses like proc_invalidate_siblings_dcache() are separate story, simply
because there d_splice_alias() is not going to move anything anywhere.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
