Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52D8ABD3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 02:14:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxKSG-00014t-0u; Tue, 13 Aug 2019 00:14:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hxKSE-00014L-FM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 00:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tJyjCSiivrYyvvAXMNCAGVNk/gtIhAZv6lckGq379x4=; b=iCSLLBSvPB0QPKf2lGQUQm5c+O
 i94m4YF8E7nMMdXbCEK2XO4B8j26i6c3kqjF08s0E76YpOL8iUUlFXwGGgRfU+zXM8FMXHy7N+IZe
 OImOEDPui9T4QzPeaiv6+aQmu8alKiXYO3IPuRaz/0HB1fpj4Ug8NdwInpc3k643+lpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tJyjCSiivrYyvvAXMNCAGVNk/gtIhAZv6lckGq379x4=; b=SKlPcOXfql8iJGYAOgSoPYxITZ
 4oqofQn0fyl40YVSNvoLmE8bBdyty1Z8pExaY5TcBfS4m54a57GG/+gKF+NuEDTLqRHvVy+YPv03M
 icHxs3Bm3Rs59MR1X7ajStGsLNwttJh+kde+dQn7h7RlbRR6+77qXB+N9xHkGmxDDl9s=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxKSC-001lCg-V3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 00:14:22 +0000
Received: from callcc.thunk.org (guestnat-104-133-9-109.corp.google.com
 [104.133.9.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7D0E7I4017125
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 20:14:08 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 1BBDD4218EF; Mon, 12 Aug 2019 20:14:07 -0400 (EDT)
Date: Mon, 12 Aug 2019 20:14:07 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190813001406.GI28705@mit.edu>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-15-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-15-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hxKSC-001lCg-V3
Subject: Re: [f2fs-dev] [PATCH v8 14/20] fscrypt: allow unprivileged users
 to add/remove keys for v2 policies
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 05, 2019 at 09:25:15AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Allow the FS_IOC_ADD_ENCRYPTION_KEY and FS_IOC_REMOVE_ENCRYPTION_KEY
> ioctls to be used by non-root users to add and remove encryption keys
> from the filesystem-level crypto keyrings, subject to limitations.
> 
> Motivation: while privileged fscrypt key management is sufficient for
> some users (e.g. Android and Chromium OS, where a privileged process
> manages all keys), the old API by design also allows non-root users to
> set up and use encrypted directories, and we don't want to regress on
> that.  Especially, we don't want to force users to continue using the
> old API, running into the visibility mismatch between files and keyrings
> and being unable to "lock" encrypted directories.
> 
> Intuitively, the ioctls have to be privileged since they manipulate
> filesystem-level state.  However, it's actually safe to make them
> unprivileged if we very carefully enforce some specific limitations.
> 
> First, each key must be identified by a cryptographic hash so that a
> user can't add the wrong key for another user's files.  For v2
> encryption policies, we use the key_identifier for this.  v1 policies
> don't have this, so managing keys for them remains privileged.
> 
> Second, each key a user adds is charged to their quota for the keyrings
> service.  Thus, a user can't exhaust memory by adding a huge number of
> keys.  By default each non-root user is allowed up to 200 keys; this can
> be changed using the existing sysctl 'kernel.keys.maxkeys'.
> 
> Third, if multiple users add the same key, we keep track of those users
> of the key (of which there remains a single copy), and won't really
> remove the key, i.e. "lock" the encrypted files, until all those users
> have removed it.  This prevents denial of service attacks that would be
> possible under simpler schemes, such allowing the first user who added a
> key to remove it -- since that could be a malicious user who has
> compromised the key.  Of course, encryption keys should be kept secret,
> but the idea is that using encryption should never be *less* secure than
> not using encryption, even if your key was compromised.
> 
> We tolerate that a user will be unable to really remove a key, i.e.
> unable to "lock" their encrypted files, if another user has added the
> same key.  But in a sense, this is actually a good thing because it will
> avoid providing a false notion of security where a key appears to have
> been removed when actually it's still in memory, available to any
> attacker who compromises the operating system kernel.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good.  I'd probably would have used either "mk_secret_sem" or
"mk->mk_secret_sem" in the comments, instead of "->mk_securet_sem",
but that's just a personal style preference.  Since you consistently
used the latter, I assume that's a deliberate choice, which is fine.

Feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
