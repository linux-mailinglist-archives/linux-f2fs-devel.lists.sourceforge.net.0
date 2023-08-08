Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 157FF7735F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 03:33:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTBbS-00088g-PH;
	Tue, 08 Aug 2023 01:33:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qTBbR-00088a-1c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 01:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xHD25iwqZs5SHKNGey/680tL/xqtANxzcX1lQhpSHQA=; b=UWNitXBTWsmw1KHw3FrL1kl+/T
 o9jBQzDbHOFXX8XQRyJnld4R6mPpRYjpm0NPMxJy6Swzt5c/CqjI7i1cvNtSLMpLnC7p+psZrb86E
 6Shqu634vbvMATA90XDdtQ8ntaUh2iqYUgvRB2NaMhdH43NmP9h7Yb6jXmpAqyPWs2J8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xHD25iwqZs5SHKNGey/680tL/xqtANxzcX1lQhpSHQA=; b=Mim+6KM5BH6hq8N3GK3qFFvrWg
 3gcxW8xVaIX6PDGfjHjSyQh+XPkL94zj+o/VOfVoYGhNxQIZfXANU/LSuhvMjWmGGk9PCuHVxln/i
 1jgfyZu/g0FcTnOX5MvB/LRJVZIeusbMsXSjg23slICRqejiKuRK0SGPF/bjmnyNEiFI=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTBbR-0003kw-4p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 01:33:42 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72DB02227F;
 Tue,  8 Aug 2023 01:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691458410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xHD25iwqZs5SHKNGey/680tL/xqtANxzcX1lQhpSHQA=;
 b=aSuwIC3zNESn8CqSZW+DUH817cAdB56MwV9eq0KzG161RXrY7+AGfBlKUvFM6bPUvD3ob8
 c2vK3JpafoF6joXSd6XV56s8Mbd32g+0eD0A7b7YHDGZf1mQDpXphDlaS1qE9BhpXxcFYW
 /I7hhO2maLBKdzkatBhn3uRXYBxk4Ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691458410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xHD25iwqZs5SHKNGey/680tL/xqtANxzcX1lQhpSHQA=;
 b=oipWzIuyuy6LSE3GEMoMTWhklVkw3hvM7j2MF51x1iQNOzpJJZPvSj3hIp5KKn2zIR5rA5
 KDs/dWzZvjszB0Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3330713910;
 Tue,  8 Aug 2023 01:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dVvrBmqb0WSBVwAAMHmgww
 (envelope-from <krisman@suse.de>); Tue, 08 Aug 2023 01:33:30 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230804044156.GB1954@sol.localdomain> (Eric Biggers's message
 of "Thu, 3 Aug 2023 21:41:56 -0700")
Organization: SUSE
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
 <20230729042048.GB4171@sol.localdomain> <875y5w10ye.fsf@suse.de>
 <20230804044156.GB1954@sol.localdomain>
Date: Mon, 07 Aug 2023 21:33:28 -0400
Message-ID: <87msz29v2v.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Thu, Aug 03, 
 2023 at 01:37:45PM -0400, Gabriel Krisman Bertazi wrote: >> Eric Biggers
 <ebiggers@kernel.org> writes: >> >> > On Thu, Jul 27, 2023 at 01:28:39PM -0400,
 Gabriel Krisman Bertazi wrote [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qTBbR-0003kw-4p
Subject: Re: [f2fs-dev] [PATCH v4 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Thu, Aug 03, 2023 at 01:37:45PM -0400, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>> > On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
>> >>   - In __lookup_slow, either the parent inode is read locked by the
>> >>     caller (lookup_slow), or it is called with no flags (lookup_one*).
>> >>     The read lock suffices to prevent ->d_name modifications, with the
>> >>     exception of one case: __d_unalias, will call __d_move to fix a
>> >>     directory accessible from multiple dentries, which effectively swaps
>> >>     ->d_name while holding only the shared read lock.  This happens
>> >>     through this flow:
>> >> 
>> >>     lookup_slow()  //LOOKUP_CREATE
>> >>       d_lookup()
>> >>         ->d_lookup()
>> >>           d_splice_alias()
>> >>             __d_unalias()
>> >>               __d_move()
>> >> 
>> >>     Nevertheless, this case is not a problem because negative dentries
>> >>     are not allowed to be moved with __d_move.
>> >
>> > Isn't it possible for a negative dentry to become a positive one concurrently?
>> 
>> Do you mean d_splice_alias racing with a dentry instantiation and
>> __d_move being called on a negative dentry that is turning positive?
>> 
>> It is not possible for __d_move to be called with a negative dentry for
>> d_splice_alias, since the inode->i_lock is locked during __d_find_alias,
>> so it can't race with __d_instantiate or d_add. Then, __d_find_alias
>> can't find negative dentries in the first place, so we either have a
>> positive dentry, in which case __d_move is fine with regard to
>> d_revalidate_name, or we don't have any aliases and don't call
>> __d_move.
>> 
>> Can you clarify what problem you see here?
>> 
>
> I agree that negative dentries can't be moved --- I pointed this out earlier
> (https://lore.kernel.org/linux-fsdevel/20230720060657.GB2607@sol.localdomain).
> The question is whether if ->d_revalidate sees a negative dentry, when can it
> assume that it remains a negative dentry for the remainder of ->d_revalidate.
> I'm not sure there is a problem, I just don't understand your
> explanation.

I see. Thanks for clarifying, as I had previously misunderstood your
point.

So, first of all, if d_revalidate itself is not a creation, it doesn't
matter, because we won't touch ->d_name. We might invalidate a valid
dentry, but that is ok.  The problem would be limited to d_revalidate
being on the creation path, where the parent (read-)lock is held.  The
problem would be doing the memcmp(), while the dentry is turned positive
(d_instantiate), while someone else moves the name.

For the dentry to be turned positive during a d_revalidate, it would
then have to race with d_add or with d_instantiate.  d_add shouldn't be
possible since we are holding the parent inode lock (at least
read-side), which will serialize file creation.

From my understanding of the code, d_instantiate also can't race with
d_revalidate for the same reason - is also serialized by the parent
inode lock, which is acquired in filename_create. At least for all paths
in ext4/f2fs. In fact, I'm failing to find a case where the lock is not
taken when instantiating a dentry, but I'm unsure if this is a guarantee
or just an artifact of the code.

It seems to be safe in the current code, but I don't know if it is a
guarantee.  Can anyone comment on this?

-- 
Gabriel Krisman Bertazi
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
