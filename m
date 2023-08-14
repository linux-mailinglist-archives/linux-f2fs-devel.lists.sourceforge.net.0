Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A805377C0A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVd8O-0005d2-Bs;
	Mon, 14 Aug 2023 19:21:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qVd8N-0005cw-Gd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jzzn8+qqnOw38PmfYxXIcDGGTpBS4WuGqRA3fqMPuAU=; b=DfzfyKQX+0oWRs2BRlEGZknJbo
 YF3SVh4ymWIWAa58L6Cx9dFsIKDUrcYqhjt5yXlHB6OzdNBdrzw0Dg5AImd+1mpphdvitDfvL3grI
 7L03q4qiMMmsdBswTyVeLfDzh2q7Tdjf00cGcTe3vYldksUO0A2pPbyw8oALpueQiuMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jzzn8+qqnOw38PmfYxXIcDGGTpBS4WuGqRA3fqMPuAU=; b=PsosEFVVJX9MNlfYAPdYwJ8LO3
 76LODYDpV8UwCZWkLIhFMgNdEUa+XZRRrXuv44f/OVG66bgIFsvpgJczGq1WgrGjzljYwxm53eB/9
 yifo8nXdP/Ok/ZDKxPwzFItSAOQEOknRHVi4i9Q2qTyqMmOY9wIf3Kv4GRfBX4a8/z28=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVd8M-0005BV-Iy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:21:48 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 577F51F383;
 Mon, 14 Aug 2023 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692040900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jzzn8+qqnOw38PmfYxXIcDGGTpBS4WuGqRA3fqMPuAU=;
 b=MKHUgKneApSsGx0nG2tQW9u3CoizNz6iCXpRUgpujLMqlj3o3YIMw7ihFbf8kj9/VxnKu2
 jYcgftdqx+kNpj/7m3465M71joDn93Q9SfKbNcOlIULi1qwS5SvdUS/YwYMLRPAeuJpFux
 qx8QpErb77ns7yYEs0ptjJPTl86AmEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692040900;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jzzn8+qqnOw38PmfYxXIcDGGTpBS4WuGqRA3fqMPuAU=;
 b=yn6rrKXwoA1JZLMto/hqDFljlhbOB2NKuypOrzq6rhmtQUhss8WNzU1FWhv6zTFVL0JK5T
 vsIZrkPqr8nvo8DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CD85138EE;
 Mon, 14 Aug 2023 19:21:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wjyQNsN+2mSMewAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 14 Aug 2023 19:21:39 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230814184214.GB1171@sol.localdomain> (Eric Biggers's message
 of "Mon, 14 Aug 2023 11:42:14 -0700")
Organization: SUSE
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-7-krisman@suse.de>
 <20230812024145.GD971@sol.localdomain> <87a5ut7k62.fsf@suse.de>
 <20230814184214.GB1171@sol.localdomain>
Date: Mon, 14 Aug 2023 15:21:33 -0400
Message-ID: <87fs4l5t1e.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Mon, Aug 14, 
 2023 at 10:50:13AM -0400, Gabriel Krisman Bertazi wrote: >> Eric Biggers
 <ebiggers@kernel.org> writes: >> >> > On Fri, Aug 11, 2023 at 08:41:42PM -0400,
 Gabriel Krisman Bertazi wrote [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1qVd8M-0005BV-Iy
Subject: Re: [f2fs-dev] [PATCH v5 06/10] libfs: Validate negative dentries
 in case-insensitive directories
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

> On Mon, Aug 14, 2023 at 10:50:13AM -0400, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>> > On Fri, Aug 11, 2023 at 08:41:42PM -0400, Gabriel Krisman Bertazi wrote:
>> >> +	/*
>> >> +	 * Filesystems will call into d_revalidate without setting
>> >> +	 * LOOKUP_ flags even for file creation (see lookup_one*
>> >> +	 * variants).  Reject negative dentries in this case, since we
>> >> +	 * can't know for sure it won't be used for creation.
>> >> +	 */
>> >> +	if (!flags)
>> >> +		return 0;
>> >> +
>> >> +	/*
>> >> +	 * If the lookup is for creation, then a negative dentry can
>> >> +	 * only be reused if it's a case-sensitive match, not just a
>> >> +	 * case-insensitive one.  This is needed to make the new file be
>> >> +	 * created with the name the user specified, preserving case.
>> >> +	 */
>> >> +	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
>> >> +		/*
>> >> +		 * ->d_name won't change from under us in the creation
>> >> +		 * path only, since d_revalidate during creation and
>> >> +		 * renames is always called with the parent inode
>> >> +		 * locked.  It isn't the case for all lookup callpaths,
>> >> +		 * so ->d_name must not be touched outside
>> >> +		 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
>> >> +		 */
>> >> +		if (dentry->d_name.len != name->len ||
>> >> +		    memcmp(dentry->d_name.name, name->name, name->len))
>> >> +			return 0;
>> >> +	}
>> >
>> > This is still really confusing to me.  Can you consider the below?  The code is
>> > the same except for the reordering, but the explanation is reworked to be much
>> > clearer (IMO).  Anything I am misunderstanding?
>> >
>> > 	/*
>> > 	 * If the lookup is for creation, then a negative dentry can only be
>> > 	 * reused if it's a case-sensitive match, not just a case-insensitive
>> > 	 * one.  This is needed to make the new file be created with the name
>> > 	 * the user specified, preserving case.
>> > 	 *
>> > 	 * LOOKUP_CREATE or LOOKUP_RENAME_TARGET cover most creations.  In these
>> > 	 * cases, ->d_name is stable and can be compared to 'name' without
>> > 	 * taking ->d_lock because the caller holds dir->i_rwsem for write.
>> > 	 * (This is because the directory lock blocks the dentry from being
>> > 	 * concurrently instantiated, and negative dentries are never moved.)
>> > 	 *
>> > 	 * All other creations actually use flags==0.  These come from the edge
>> > 	 * case of filesystems calling functions like lookup_one() that do a
>> > 	 * lookup without setting the lookup flags at all.  Such lookups might
>> > 	 * or might not be for creation, and if not don't guarantee stable
>> > 	 * ->d_name.  Therefore, invalidate all negative dentries when flags==0.
>> > 	 */
>> > 	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
>> > 		if (dentry->d_name.len != name->len ||
>> > 		    memcmp(dentry->d_name.name, name->name, name->len))
>> > 			return 0;
>> > 	}
>> > 	if (!flags)
>> > 		return 0;
>> 
>> I don't see it as particularly better or less confusing than the
>> original. but I also don't mind taking it into the next iteration.
>> 
>
> Your commit message is still much longer and covers some quite different details
> which seem irrelevant to me.  So if you don't see my explanation as being much
> different, I think we're still not on the same page.  I hope that I'm not
> misunderstanding anything, in which I believe that what I wrote above is a good
> explanation and your commit message should be substantially simplified.
> Remember, longer != better.  Keep things as simple as possible.

I think we are on the same page regarding the code.  I was under the
impression your suggestion was regarding the *code comment* you proposed
to replace, and not the commit message.  I don't see your code comment
to be much different than the original.

The commit message has information accumulated on previous discussions,
including the conclusions from the locking discussion Viro requested.
I'll reword it too for the next iteration to see if I can make it more
concise.

Thx

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
