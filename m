Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF78D76F0C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 19:38:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRcHG-0004tq-6o;
	Thu, 03 Aug 2023 17:38:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qRcH9-0004tS-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 17:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUrIcCgKfn8Ln+psoMSqthh4paG1THVbdii5u1kozU8=; b=ZpmP1QfrhZE5+mPnSIeTYsaCnc
 NMPEfA6uNmFnBN2hqBM7Cw6aeA9LDqk4KNJCOQ3L32jI2ltR2D0Gt+TrxcXBiPhlWMDf0BSj1zauZ
 CCML3VoxZTZ7x1E99NN4CxpsWJO2/YnCtfwHRcGYAfEBjWlLGPtx6WMhloYXaSnUxbeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nUrIcCgKfn8Ln+psoMSqthh4paG1THVbdii5u1kozU8=; b=J1d/rRMxsQWfTNWQGj93cwzS1g
 gJo8xprB6z1n6VBoQvlVzmhbJA+3Jk/NNUjGvPw/Bvlj+ZzR/xa66LcPB8OSnfTEXTFuAp4aU+WpS
 OaWzUG+wodTBAUV4a3oQQaJsXWiTBF/0uCNfA15GhfyKsE1VxbAz6K+JgzFhao+LrOVM=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRcGn-00069O-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 17:37:55 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BDF3218EB;
 Thu,  3 Aug 2023 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691084267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUrIcCgKfn8Ln+psoMSqthh4paG1THVbdii5u1kozU8=;
 b=OGxF/Y/oYJ1fU84+6F/RoPLLg35d4x0oZCxn7NJYfsPYaWyvnRyXHf4DpYhnHIw3AkH3PX
 BJZstYEbB8LUqRjqLjnTpX/TyqqePgq5GT48C61y8Lb4rZ9K2dtS1h0Smt0EYdOu76tQNZ
 CvchZify8FuYF5UYOBMlpefOsxln22g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691084267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUrIcCgKfn8Ln+psoMSqthh4paG1THVbdii5u1kozU8=;
 b=ho8JvdBvLvswROYHxKBwf9LRoHGI9RbaY2o/N43xAICwJABGHb/t2edJT1Nkm29HchCy3L
 qOnMv5JMwYiyM3CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DDA3134B0;
 Thu,  3 Aug 2023 17:37:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CX3WEOvly2R3fQAAMHmgww
 (envelope-from <krisman@suse.de>); Thu, 03 Aug 2023 17:37:47 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Organization: SUSE
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
 <20230729042048.GB4171@sol.localdomain>
Date: Thu, 03 Aug 2023 13:37:45 -0400
In-Reply-To: <20230729042048.GB4171@sol.localdomain> (Eric Biggers's message
 of "Fri, 28 Jul 2023 21:20:48 -0700")
Message-ID: <875y5w10ye.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Thu, Jul 27, 
 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote: >> - In __lookup_slow,
 either the parent inode is read locked by the >> caller (lookup_slow), or
 it is called with no flags ( [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRcGn-00069O-S4
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

> On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
>>   - In __lookup_slow, either the parent inode is read locked by the
>>     caller (lookup_slow), or it is called with no flags (lookup_one*).
>>     The read lock suffices to prevent ->d_name modifications, with the
>>     exception of one case: __d_unalias, will call __d_move to fix a
>>     directory accessible from multiple dentries, which effectively swaps
>>     ->d_name while holding only the shared read lock.  This happens
>>     through this flow:
>> 
>>     lookup_slow()  //LOOKUP_CREATE
>>       d_lookup()
>>         ->d_lookup()
>>           d_splice_alias()
>>             __d_unalias()
>>               __d_move()
>> 
>>     Nevertheless, this case is not a problem because negative dentries
>>     are not allowed to be moved with __d_move.
>
> Isn't it possible for a negative dentry to become a positive one concurrently?

Do you mean d_splice_alias racing with a dentry instantiation and
__d_move being called on a negative dentry that is turning positive?

It is not possible for __d_move to be called with a negative dentry for
d_splice_alias, since the inode->i_lock is locked during __d_find_alias,
so it can't race with __d_instantiate or d_add. Then, __d_find_alias
can't find negative dentries in the first place, so we either have a
positive dentry, in which case __d_move is fine with regard to
d_revalidate_name, or we don't have any aliases and don't call
__d_move.

Can you clarify what problem you see here?

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
