Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BFC77C0C2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVdDO-0000CQ-0l;
	Mon, 14 Aug 2023 19:26:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qVdDI-0000CG-NJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QorXVpMmp6KKSrCodB3zbD97W/z12lZeOZogm8hygqI=; b=dirUXkD814gj6LCvEmJE7Ve2+H
 52ZT+LdMKcmNZ3SLQAbZNCu7JaCQ8nURJtCu+ENtrD9F7oHUJun7oPdlbXNtoEBoA9xVhY0941c6T
 oQhWu39V8YrI5nTIwn/mdJRbfniF0vLnzDUiuzo1jeVgVc6Xk/PLuBQX+1UC1A4B6NbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QorXVpMmp6KKSrCodB3zbD97W/z12lZeOZogm8hygqI=; b=hHAARe70DGVjoCewWTg8DHxHIK
 h0hye0CllB2xiRG/po2qHMHwnOAGop0C+4oscB21E/Z+q/r+aC9cb/Q0EDxIoy19aYs5mG8wDCwKP
 3bUyTRc/l39L4Cs3oJu440dYMV2HGqo+vHXvaPj1qWHVfj6tlMJ3DojtblN0JqtzE5Ew=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVdDF-005lDS-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:26:53 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25A661F45B;
 Mon, 14 Aug 2023 19:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692041199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QorXVpMmp6KKSrCodB3zbD97W/z12lZeOZogm8hygqI=;
 b=lvkECSmw6TeAZfy/ZSr/L817+CFOVowjyv4vLLInhux4KLABt/vHjsVn8tBlBUvi4j/2I6
 +mK3gjcQJnLmySn+jm3V8DHo6E+lJMWEi4zZG0qRl7p6OlWDAUsD6bkkqagZst+24dizVa
 0p9aLllrZjQ81Dtj8CK3waL1d1hix24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692041199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QorXVpMmp6KKSrCodB3zbD97W/z12lZeOZogm8hygqI=;
 b=rFhK6BPxSibnhzrudHgEFQG2KX2GCwMqMZD0gcLYqI1epUtafobu2QxxxOq2Aobgi/loeF
 Ra9qAJ9Ot1tleoBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFA42138EE;
 Mon, 14 Aug 2023 19:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5cqWKu5/2mRUfQAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 14 Aug 2023 19:26:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230814191426.GC1171@sol.localdomain> (Eric Biggers's message
 of "Mon, 14 Aug 2023 12:14:26 -0700")
Organization: SUSE
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain> <875y5h7jld.fsf@suse.de>
 <20230814191426.GC1171@sol.localdomain>
Date: Mon, 14 Aug 2023 15:26:32 -0400
Message-ID: <87bkf95st3.fsf@suse.de>
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
 2023 at 11:02:38AM -0400, Gabriel Krisman Bertazi wrote: >> >> Also, this
 patchset has been sitting for years before the latest >> discussions, and
 I'm tired of it, so I'm happy to k [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qVdDF-005lDS-F1
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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

> On Mon, Aug 14, 2023 at 11:02:38AM -0400, Gabriel Krisman Bertazi wrote:
>> 
>> Also, this patchset has been sitting for years before the latest
>> discussions, and I'm tired of it, so I'm happy to keep this
>> discussion for another time.  Will drop this patch and just check
>> IS_CASEFOLDED in ecryptfs for the next iteration.
>> 
>> I'll follow up with another case-insensitive cleanup patchset I've been
>> siting on forever, which includes this patch and will restart this
>> discussion, among others.
>> 
>
> Well, as we know unfortunately filesystem developers are in short supply, and
> doing proper reviews (identifying issues and working closely with the patchset
> author over multiple iterations to address them, as opposed to just slapping on
> a Reviewed-by) is very time consuming.  Earlier this year I tried to get the
> Android Systems team, which is ostensibly responsible for Android's use of
> casefolding, to take a look, but their entire feedback was just "looks good to
> me".  Also, the fact that this patchset originally excluded the casefold+encrypt
> case technically made it not applicable to Android, and discouraged me from
> taking a look since encryption is my focus.  Sorry for not taking a look sooner.
>
> Anyway, thanks for doing this, and I think it's near the finish line now.  Once

On the contrary, thank *you* for your review. I always appreciate your
feedback, particularly since you are always able to find the corner
cases I missed. That, and your responsiveness, are the reasons I always
put you in my --cc list since v1 for anything related to unicode/fs :)



-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
