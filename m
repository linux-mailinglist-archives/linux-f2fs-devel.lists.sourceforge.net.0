Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F6759D40
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jul 2023 20:27:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMBtP-0002oN-OS;
	Wed, 19 Jul 2023 18:27:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qMBtO-0002oE-Pm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jul 2023 18:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhOyZ0ZdWLkpby1Iqtq7SFOqx2lnmUd32VWJ4JlD36g=; b=AcYB5ycTXr6uBvlO+sMmpcSIWK
 WYDBnpMu1Y1Zoz9Cq2pjDjscEfqlP299C+o0rf/YETkiwUPQ1HgJVcegu4IW1kJAUMKTWqVGhzd+1
 O+o9F3fobtJsWkZlMMTuKUlwGa8U+JACnD8/aeoqyqJIuuVO/sAQoAQBw2RXaki1ZTig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YhOyZ0ZdWLkpby1Iqtq7SFOqx2lnmUd32VWJ4JlD36g=; b=Duf8iy4k+LMsp7i7ScbvD+NakN
 OjgOCoPXan/FtBeRGFfcJlMGu+IWTaNs+RWGS80fo895bFwg/RZj8ZYa4a3bwj+ir5AO8rU428rQ9
 TC7OTkvwZkM/YzSiDfYSy+hQsdOifEtolK/rSBIszTfoXzaEjGiu1JJfxCSoioRqFT5g=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qMBtO-0005KW-TB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jul 2023 18:27:17 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6A2F200A9;
 Wed, 19 Jul 2023 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689791226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YhOyZ0ZdWLkpby1Iqtq7SFOqx2lnmUd32VWJ4JlD36g=;
 b=q1pdcQZFX7fifseO0xceZtJzp64S4KFfju3lzq3XamQ4l+/jrkC9W9yY8ELdzRNXOKk9pm
 BxzTE/f0OoOHt6g8jiCH/YXB2SKcw8cb7yjf3TDZcYy8TYspyfp2qdkRZzeqQfbICZTcP+
 8b50YM1XhfVza9lBxrUkCPGEPW8NeKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689791226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YhOyZ0ZdWLkpby1Iqtq7SFOqx2lnmUd32VWJ4JlD36g=;
 b=7zQHJhTWV4xn+EbDtJEI8gXkRtL3feXW+bzV28gFBd4UZIC1ArWepTBVRpeIMHZKE7+4qB
 Kzm9IpgtZrSQnuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74C9D1361C;
 Wed, 19 Jul 2023 18:27:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SwbvFvoquGS1QwAAMHmgww
 (envelope-from <krisman@suse.de>); Wed, 19 Jul 2023 18:27:06 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Organization: SUSE
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-5-krisman@suse.de>
 <20230714053135.GD913@sol.localdomain> <87h6q1580a.fsf@suse.de>
 <20230718221040.GA1005@sol.localdomain>
Date: Wed, 19 Jul 2023 14:27:05 -0400
In-Reply-To: <20230718221040.GA1005@sol.localdomain> (Eric Biggers's message
 of "Tue, 18 Jul 2023 15:10:40 -0700")
Message-ID: <874jlz69l2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> writes: > Why would order
 matter? If either "feature" wants the dentry to be invalidated, > then the
 dentry gets invalidated. For instance, I was wondering makes sense for instance
 to memcmp d_name for !DCACHE_NOKEY_NAME or if we wanted fscrypt_d_revalidate
 to come first. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qMBtO-0005KW-TB
Subject: Re: [f2fs-dev] [PATCH v2 4/7] libfs: Support revalidation of
 encrypted case-insensitive dentries
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> Why would order matter?  If either "feature" wants the dentry to be invalidated,
> then the dentry gets invalidated.

For instance, I was wondering makes sense for instance to memcmp d_name for
!DCACHE_NOKEY_NAME or if we wanted fscrypt_d_revalidate to come first.

>> Note we will start creating negative dentries in casefold directories after
>> patch 6/7, so unless we disable it here, we will start calling
>> fscrypt_d_revalidate for negative+casefold.
>
> fscrypt_d_revalidate() only cares about the DCACHE_NOKEY_NAME flag, so that's
> not a problem.

..I see now it is the first thing checked in fscrypt_d_revalidate.

>> Should I just drop this hunk?  Unless you are confident it works as is, I
>> prefer to add this support in stages and keep negative dentries of
>> encrypted+casefold directories disabled for now.
>
> Unless I'm missing something, I think you're overcomplicating it.

Not overcomplicating. I'm just not familiar with fscrypt details enough to be
sure I could enable it.  But yes, it seems safe.

> It should
> just work if you don't go out of your way to prohibit this case.  I.e., just
> don't add the IS_ENCRYPTED(dir) check to generic_ci_d_revalidate().

I'll drop the check. And resend.

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
