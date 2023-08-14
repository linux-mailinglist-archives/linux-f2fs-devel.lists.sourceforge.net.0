Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9577BC4E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 17:04:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVZ75-0002Uu-KL;
	Mon, 14 Aug 2023 15:04:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qVZ71-0002Un-2r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 15:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ikjBFN0Ka0bI757B2lq4/0p/MfhZslYWurHfE0DdwD8=; b=Ujoy0cxJ6eXRk5xT7rzUXykkO8
 1X+xkfyOfEHaPbIvoUsPivNmIlrbRQhrc7pAR7hNEYk3QOGbLThLNfg/VVlUw8Qq1M/h9gWNBd3BS
 6w1hYhHuL6aCWimTKy9H3YPyOGNgFlnjqQpq0K256bZhB0Y1a07HXc/cQFv0OUnMj+ww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ikjBFN0Ka0bI757B2lq4/0p/MfhZslYWurHfE0DdwD8=; b=RmD15hKr6u8rQ1zOQIUjHjSYyl
 J/DI+NqTPINx8uh40dO1Qbm7DhPdwQZqHiI98RiLcGqDxrQK9V49ICWN2n3YcVWsoDrAX5GU3zLBU
 8jjMaWKapg1jeRR7fXLWJIaSHxJseEuzFYJrBK0aO6XRk8ybU+72yhvg8kvMvYHY66QA=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVZ6s-0003uU-Te for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 15:04:05 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 619152189D;
 Mon, 14 Aug 2023 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692025431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikjBFN0Ka0bI757B2lq4/0p/MfhZslYWurHfE0DdwD8=;
 b=MpYoaQnS+SFuOKQ7652w6g2RWyh5yDEplZ81k9aqvAJDkZhDc3os45n/TeqR40F8RVMgLI
 eWaFiuMRddskL9tqr7YMoBsR8wBp7mpswDwKhjNn62pcPNsD9KR9TzaYgZYV0OXELJ2EFP
 ceA6osOg/ooSVVSsS4MmGzMlAJJo3Fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692025431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikjBFN0Ka0bI757B2lq4/0p/MfhZslYWurHfE0DdwD8=;
 b=6yX3Wz+/qiLF41yBjPsUdVlWjvvhqL3oZhYAH875G3cnL9WLwLhjpdvCO8OUr0bLp/QHyH
 E3IWOV9Xld4Y9QBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18BC3138EE;
 Mon, 14 Aug 2023 15:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 39ceOlZC2mSVDAAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 14 Aug 2023 15:03:50 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230812021700.GC971@sol.localdomain> (Eric Biggers's message of
 "Fri, 11 Aug 2023 19:17:00 -0700")
Organization: SUSE
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-6-krisman@suse.de>
 <20230812021700.GC971@sol.localdomain>
Date: Mon, 14 Aug 2023 11:03:49 -0400
Message-ID: <871qg57jje.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Aug 11, 
 2023 at 08:41:41PM -0400,
 Gabriel Krisman Bertazi wrote: >> +void d_set_casefolded_name(struct
 dentry *dentry) >> +{ >> + spin_lock(&dentry->d_lock); >> + dentry->d_flags
 |= DCACHE_C [...] 
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
X-Headers-End: 1qVZ6s-0003uU-Te
Subject: Re: [f2fs-dev] [PATCH v5 05/10] fs: Add DCACHE_CASEFOLDED_NAME flag
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

> On Fri, Aug 11, 2023 at 08:41:41PM -0400, Gabriel Krisman Bertazi wrote:
>> +void d_set_casefolded_name(struct dentry *dentry)
>> +{
>> +	spin_lock(&dentry->d_lock);
>> +	dentry->d_flags |= DCACHE_CASEFOLDED_NAME;
>> +	spin_unlock(&dentry->d_lock);
>> +}
>> +EXPORT_SYMBOL(d_set_casefold_lookup);
>
> s/d_set_casefold_lookup/d_set_casefolded_name/

My apologies for this error again.  It sucks there is no compile-time
warning for EXPORT_SYMBOL, but I should have caught it in the past two
iterations.  Will fix.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
