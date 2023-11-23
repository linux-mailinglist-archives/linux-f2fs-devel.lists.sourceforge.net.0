Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 023357F6598
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 18:38:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6DeS-0001Re-Mr;
	Thu, 23 Nov 2023 17:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gabriel@krisman.be>) id 1r6DeQ-0001RX-If
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 17:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aE8aUEa9aAZvs4jBkIx+0j52NfPIGVPGiVlPWv3lCf4=; b=M6reXASUYjk0JHltypBW5oDZqJ
 kcK8V7/wIIGuUfVLMkXdokZmFOO1KmWnCKrGEDXkVVR9Fa79zXtEdG9HwkIIDHzgNf4PA7WDF55sp
 ucqe1VZzUe/8De96AblheNtLgzvFAFbovf/ECctqXbDdxxfA86pTRZ4VBX5ei1fJ5XmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aE8aUEa9aAZvs4jBkIx+0j52NfPIGVPGiVlPWv3lCf4=; b=Iz//oiTeFyvIPHnAUrKTRsuXWT
 mQsfMmHwayDmg25h567aHIhB05Nu+5yxlB8ZGQ+vUW0rNYjtxqNNX03M9rti1+nbA8hKRGlajW5Eb
 T/D2GZtCS/ewk1sW7xvreclsgD/LtSw89GoMY/xLePE7n55Sr5VlVhQVU1JhW17acg+M=;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6DeE-0008GS-DC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 17:38:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D88FDFF809;
 Thu, 23 Nov 2023 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=gm1;
 t=1700761066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aE8aUEa9aAZvs4jBkIx+0j52NfPIGVPGiVlPWv3lCf4=;
 b=TR6RKpJtGtwhTO/9QTjmH69srCGp1iqc+0yDO4y3r5dOxuneAh0a64obgAT3tKkJii1V2o
 u18GtIPMuhkXOfnrnZAEDioqxM4aCdy6SQyNRebdb4qeHVoWor1NEr6F4a6KEmXGuNOYuh
 deAnY5WhiI1kOeQNvOXOgghf9uzP0jKheNnfN0AdF2UhfFonstsYq1wkWiIl9tpyIL6rRc
 /wMCdUJehUSjH+ojEHcOtmDnkLkphUcJwxs+e9YAtaEz7/FKyHPPCC6qP/DPPf8TCiBZI2
 3XZ1rh085NeBrVCikkNnXV3jXGxGI6JJikPo/4NaPc70hhLkmJpV/NdJAVHrkw==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Al Viro <viro@zeniv.linux.org.uk>
In-Reply-To: <20231123171255.GN38156@ZenIV> (Al Viro's message of "Thu, 23 Nov
 2023 17:12:55 +0000")
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV>
Date: Thu, 23 Nov 2023 12:37:43 -0500
Message-ID: <87h6lcid5k.fsf@>
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
 2023 at 10:57:22AM -0500, Gabriel Krisman Bertazi wrote: >> Linus Torvalds
 <torvalds@linux-foundation.org> writes: >> >> > Side note: Gabriel, as things
 are now, instead of that >> > [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [217.70.183.199 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [217.70.183.199 listed in wl.mailspike.net]
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
X-Headers-End: 1r6DeE-0008GS-DC
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

> On Thu, Nov 23, 2023 at 10:57:22AM -0500, Gabriel Krisman Bertazi wrote:
>> Linus Torvalds <torvalds@linux-foundation.org> writes:
>> 
>> > Side note: Gabriel, as things are now, instead of that
>> >
>> >         if (!d_is_casefolded_name(dentry))
>> >                 return 0;
>> >
>> > in generic_ci_d_revalidate(), I would suggest that any time a
>> > directory is turned into a case-folded one, you'd just walk all the
>> > dentries for that directory and invalidate negative ones at that
>> > point. Or was there some reason I missed that made it a good idea to
>> > do it at run-time after-the-fact?
>> >
>> 
>> The problem I found with that approach, which I originally tried, was
>> preventing concurrent lookups from racing with the invalidation and
>> creating more 'case-sensitive' negative dentries.  Did I miss a way to
>> synchronize with concurrent lookups of the children of the dentry?  We
>> can trivially ensure the dentry doesn't have positive children by
>> holding the parent lock, but that doesn't protect from concurrent
>> lookups creating negative dentries, as far as I understand.
>
> AFAICS, there is a problem with dentries that never came through
> ->lookup().  Unless I'm completely misreading your code, your
> generic_ci_d_revalidate() is not called for them.  Ever.
>
> Hash lookups are controlled by ->d_op of parent; that's where ->d_hash()
> and ->d_compare() come from.  Revalidate comes from *child*.  You need
> ->d_op->d_revalidate of child dentry to be set to your generic_ci_d_revalidate().
>
> The place where it gets set is generic_set_encrypted_ci_d_ops().  Look
> at its callchain; in case of ext4 it gets called from ext4_lookup_dentry(),
> which is called from ext4_lookup().  And dentry passed to it is the
> argument of ->lookup().
>
> Now take a look at open-by-fhandle stuff; all methods in there
> (->fh_to_dentry(), ->fh_to_parent(), ->get_parent()) end up
> returning d_obtain_alias(some inode).
>
> We *do* call ->lookup(), all right - in reconnect_one(), while
> trying to connect those suckers with the main tree.  But the way
> it works is that d_splice_alias() in ext4_lookup() moves the
> existing alias for subdirectory, connecting it to the parent.
> That's not the dentry ext4_lookup() had set ->d_op on - that's
> the dentry that came from d_obtain_alias().  And those do not
> have ->d_op set by anything in your tree.
>
> That's the problem I'd been talking about - there is a class of situations
> where the work done by ext4_lookup() to set the state of dentry gets
> completely lost.  After lookup you do have a dentry in the right place,
> with the right name and inode, etc., but with NULL
> ->d_op->d_revalidate.

I get the problem now. I admit to not understanding all the details yet,
which is why I haven't answered directly, but I understand already how
it can get borked.  I'm studying your explanation.

Originally, ->d_op could be propagated trivially since we had sb->s_d_op
set, which would be set by __d_alloc, but that is no longer the case
since we combined fscrypt and CI support.

What I still don't understand is why we shouldn't fixup ->d_op when
calling d_obtain_alias (before __d_instantiate_anon) and you say we
better do it in d_splice_alias.  The ->d_op is going to be the same
across the filesystem when the casefold feature is enabled, regardless
if the directory is casefolded.  If we set it there, the alias already
has the right d_op from the start.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
