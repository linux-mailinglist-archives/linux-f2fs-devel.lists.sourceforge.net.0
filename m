Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C877C113
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:53:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVdcd-0006xg-TP;
	Mon, 14 Aug 2023 19:53:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qVdcc-0006xa-Nq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fnp8DJ6XQ4hPYRcJy/nsfcfTRDpO230iMwFulsuB2qI=; b=k2MQdidnuF3GNo1pFeIU6WsJwu
 iJJW77e4S/mBqn1IeKlGk+UBumrVMxI+91TXHppBo+/CNVA323dAGoSzQmFKZSL9lxuRQGH59SgJB
 KaL5cous/M7zJS+4cFRxePoCnpTgczyVquD3JYVww++XWZ3eLswHuMTKxY3d4yyZAcUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fnp8DJ6XQ4hPYRcJy/nsfcfTRDpO230iMwFulsuB2qI=; b=RW4sXiAEqZK57cpZGyKNdFV0YF
 XVUh5OoKrXZncYf0qwwRyUX5PB9BfkXZzUkdAF/qJCrQmdXUQvjW5OkXKyJRMGKNA09Rpx0b9TNnu
 rvImR3SskKxdgVv4TmzwNbIGZpX1RAR3dyinRDOQuJqNumX0MCfmlHKQLJ+IQUdwxJPY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVdcd-0006HP-1I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:53:03 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5E1A21863;
 Mon, 14 Aug 2023 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692042776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fnp8DJ6XQ4hPYRcJy/nsfcfTRDpO230iMwFulsuB2qI=;
 b=wByIaV0BL2fwDFE3J5nsBdtkQzW7TreNuCuEN9lhHwgEgoYnFC1XQ93HdN5G8rOWbFZMhT
 tYxwmAMaIzfjoeFuqurMetjJH488jmFcc+609XpKGN0/2SoF7f4o87MxQ9u9dgYsojQf8R
 gfiL8hOR5f58OntElmGyYzTSop523WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692042776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fnp8DJ6XQ4hPYRcJy/nsfcfTRDpO230iMwFulsuB2qI=;
 b=cBEhiBwHrNtCo9a8pCW2gguVJaQI0PcZNTAmf9QC7ki0cTi3TSsJQD9u5PuWwtOIa1RfJm
 wFZ7kc4vL+LxF4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 766A6138E2;
 Mon, 14 Aug 2023 19:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LGLCFBiG2mSGCAAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 14 Aug 2023 19:52:56 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230814192406.GD1171@sol.localdomain> (Eric Biggers's message
 of "Mon, 14 Aug 2023 12:24:06 -0700")
Organization: SUSE
References: <20230814182903.37267-1-ebiggers@kernel.org>
 <20230814182903.37267-2-ebiggers@kernel.org> <87jztx5tle.fsf@suse.de>
 <20230814192406.GD1171@sol.localdomain>
Date: Mon, 14 Aug 2023 15:52:54 -0400
Message-ID: <877cpx5rl5.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Mon, Aug 14, 
 2023 at 03:09:33PM -0400, Gabriel Krisman Bertazi wrote: >> Eric Biggers
 <ebiggers@kernel.org> writes: >> >> > From: Eric Biggers <ebiggers@google.com>
 >> > >> > It is invalid for th [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qVdcd-0006HP-1I
Subject: Re: [f2fs-dev] [PATCH 1/3] ext4: reject casefold inode flag without
 casefold feature
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Mon, Aug 14, 2023 at 03:09:33PM -0400, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>> > From: Eric Biggers <ebiggers@google.com>
>> >
>> > It is invalid for the casefold inode flag to be set without the casefold
>> > superblock feature flag also being set.  e2fsck already considers this
>> > case to be invalid and handles it by offering to clear the casefold flag
>> > on the inode.  __ext4_iget() also already considered this to be invalid,
>> > sort of, but it only got so far as logging an error message; it didn't
>> > actually reject the inode.  Make it reject the inode so that other code
>> > doesn't have to handle this case.  This matches what f2fs does.
>> >
>> > Note: we could check 's_encoding != NULL' instead of
>> > ext4_has_feature_casefold().  This would make the check robust against
>> > the casefold feature being enabled by userspace writing to the page
>> > cache of the mounted block device.  However, it's unsolvable in general
>> > for filesystems to be robust against concurrent writes to the page cache
>> > of the mounted block device.  Though this very particular scenario
>> > involving the casefold feature is solvable, we should not pretend that
>> > we can support this model, so let's just check the casefold feature.
>> > tune2fs already forbids enabling casefold on a mounted filesystem.
>> 
>> just because we can't fix the general issue for the entire filesystem
>> doesn't mean this case *must not* ever be addressed. What is the
>> advantage of making the code less robust against the syzbot code?  Just
>> check sb->s_encoding and be safe later knowing the unicode map is
>> available.
>> 
>
> Just to make sure, it sounds like you agree that the late checks of ->s_encoding
> are not needed and only __ext4_iget() should handle it, right?  That simplifies
> the code so it is obviously beneficial if we can do it.

Yes.  After we get the inode from __ext4_iget, I think it doesn't matter
if the user went behind our back straight to the block device and
changed the superblock to remove the feature bit. If we already loaded
->s_encoding, it won't be unloaded, so only checking at ext4_iget should
be enough, as far as I can tell.


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
