Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D357F09CE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 00:12:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r4qxL-0003r6-94;
	Sun, 19 Nov 2023 23:11:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1r4qxK-0003r0-1P
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Nov 2023 23:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKLnl/b8FKP562p7zrfLcmIgpEtVLt1qt4EDjEmPx0s=; b=mP5V7RgL8kiMn/WRi4u9wm3qkY
 WJ9YFizHH6BLdj7LOLC9HQEfYi9ce86c8coRQ8UfA/VgvNpiNjmPqXNJpOSYVBkoWhnSphKdC2eVC
 dvFo05slDYpnHyQqC9nnv25UU0xEytDJ+2rf0hdqcWc1Jt3hPUfBfm8YrTmbREvGZ4RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TKLnl/b8FKP562p7zrfLcmIgpEtVLt1qt4EDjEmPx0s=; b=mkIllUrqMnVm5/dE+o0lW9fL3T
 JqDcMlfqyd4yxfzck2cCxzaLlMUBXKcO2iPPGrgK2uXynpo6eW8QlL2Q+bwjsPlFC1T8pKfyz0DEu
 H5CUTxftlWuhDWMxA8NcQFmGxb8t9pbgZF3QkuyHWrjAehnMWpMHDOhj4FOECq7suiec=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r4qxH-00AZ6W-TR for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Nov 2023 23:11:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2445C218E2;
 Sun, 19 Nov 2023 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700435501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TKLnl/b8FKP562p7zrfLcmIgpEtVLt1qt4EDjEmPx0s=;
 b=Srs5e4BIjVBqkWA0tR1OgOyfaO1V1y+21/Awh6Q5mCwFcf8Hm9PWv5MdYHf2n8KalBaIdU
 qJ0Ysb4qPrH08rGIfmJhLYgtpXCR3yG2mo7nCgYEQjhIa/RFy7T3kxbHQg9/SwmfNtwtcd
 dvFsnedD4omSS2PGdEOVseXfaf/Wq+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700435501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TKLnl/b8FKP562p7zrfLcmIgpEtVLt1qt4EDjEmPx0s=;
 b=4PAv7liNx3tzKNeWwZji/+kmb3WJWBqzNRdXEcVsTL8vCBDEb5IgrTPDBgXHu7Ex9obz/e
 hFO4tfC+nIgMqVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7C521377F;
 Sun, 19 Nov 2023 23:11:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id arMlLyyWWmWVbQAAMHmgww
 (envelope-from <krisman@suse.de>); Sun, 19 Nov 2023 23:11:40 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christian Brauner <brauner@kernel.org>
In-Reply-To: <20231025-selektiert-leibarzt-5d0070d85d93@brauner> (Christian
 Brauner's message of "Wed, 25 Oct 2023 15:32:02 +0200")
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
Date: Sun, 19 Nov 2023 18:11:39 -0500
Message-ID: <87r0kl5oes.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *****
X-Spam-Score: 5.60
X-Spamd-Result: default: False [5.60 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 INVALID_MSGID(1.70)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_SPAM_SHORT(3.00)[0.999];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_SPAM_LONG(3.50)[1.000]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christian Brauner <brauner@kernel.org> writes: > On Wed, 16
 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote: >> This is v6 of
 the negative dentry on case-insensitive directories. >> Thanks Eric for the
 review of the last iteration. This ver [...] 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
X-Headers-End: 1r4qxH-00AZ6W-TR
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christian Brauner <brauner@kernel.org> writes:

> On Wed, 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote:
>> This is v6 of the negative dentry on case-insensitive directories.
>> Thanks Eric for the review of the last iteration.  This version
>> drops the patch to expose the helper to check casefolding directories,
>> since it is not necessary in ecryptfs and it might be going away.  It
>> also addresses some documentation details, fix a build bot error and
>> simplifies the commit messages.  See the changelog in each patch for
>> more details.
>> 
>> [...]
>
> Ok, let's put it into -next so it sees some testing.
> So it's too late for v6.7. Seems we forgot about this series.
> Sorry about that.

Christian,

We are approaching -rc2 and, until last Friday, it didn't shown up in
linux-next. So, to avoid turning a 6 month delay into 9 months, I pushed
your signed tag to linux-next myself.

That obviously uncovered a merge conflict: in v6.6, ceph added fscrypt,
and the caller had to be updated.  I fixed it and pushed again to
linux-next to get more testing.

Now, I don't want to send it to Linus myself. This is 100% VFS/FS code,
I'm not the maintainer and it will definitely raise eyebrows.  Can you
please requeue and make sure it goes through this time?  I'm happy to
drop my branch from linux-next once yours shows up.

  https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git/log/?h=negative-dentries

This branch has the latest version with the ceph conflict folded in.  I
did it this way because I'd consider it was never picked up and there is
no point in making the history complex by adding a fix on top of your
signed tag, since it already fails to build ceph.

I can send it as a v7; but I prefer you just pull from the branch
above. Or you can ack and I'll send to Linus.

This is the diff from you signed tag:

diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c
index 629d8fb31d8f..21278a9d9baa 100644
--- a/fs/ceph/dir.c
+++ b/fs/ceph/dir.c
@@ -1869,7 +1869,7 @@ static int ceph_d_revalidate(struct dentry *dentry, const struct qstr *name,
        struct inode *dir, *inode;
        struct ceph_mds_client *mdsc;
 
-       valid = fscrypt_d_revalidate(dentry, flags);
+       valid = fscrypt_d_revalidate(dentry, name, flags);
        if (valid <= 0)
                return valid;
 
diff --git a/fs/ecryptfs/dentry.c b/fs/ecryptfs/dentry.c
index 56093648d838..ce86891a1711 100644
--- a/fs/ecryptfs/dentry.c
+++ b/fs/ecryptfs/dentry.c
@@ -18,6 +18,7 @@
 /**
  * ecryptfs_d_revalidate - revalidate an ecryptfs dentry
  * @dentry: The ecryptfs dentry
+ * @name: The name under lookup
  * @flags: lookup flags
  *
  * Called when the VFS needs to revalidate a dentry. This
diff --git a/fs/gfs2/dentry.c b/fs/gfs2/dentry.c
index 3dd93d36aaf2..5e4910e016a8 100644
--- a/fs/gfs2/dentry.c
+++ b/fs/gfs2/dentry.c
@@ -22,6 +22,7 @@
 /**
  * gfs2_drevalidate - Check directory lookup consistency
  * @dentry: the mapping to check
+ * @name: The name under lookup
  * @flags: lookup flags
  *
  * Check to make sure the lookup necessary to arrive at this inode from its

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
