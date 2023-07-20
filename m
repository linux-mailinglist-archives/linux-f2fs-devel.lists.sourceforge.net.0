Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BF75B5B3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 19:36:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMXZ9-0006eV-UC;
	Thu, 20 Jul 2023 17:35:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qMXZ8-0006eO-K9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 17:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bx1yg3Jg+5Ltd8iqCFWRF8VuzeM7HV3z2vdytiQt5Yk=; b=Zl83acuWn378Vglh+UKRIB0hxk
 BQtfGbVpUJSn8xBPEwC+5prLvyxC9IcHkXjd+P9phLrgUxHARqu8uMFFpJYqDX+iePzfB8me3KZd4
 TwNrUtjIcXDYo/DgL0JMS9Te9fa+unEk8dwHLtoI1n1YNNhVseTmIx8NXTH1jglK4oEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bx1yg3Jg+5Ltd8iqCFWRF8VuzeM7HV3z2vdytiQt5Yk=; b=CL+V+j2H8Nv2DGGOermZoumRRA
 sks2uy3UhCAJR/SKwMdLg84m4b3bTE4TVTA7fgmn4VZpyM2GyNpUN3ITooZbJmcMzWZKv5p+d8bnP
 w57aWXRLImVSwsji8I29v6PZiOKJjElCa7QQIAtI3OQWg2vxBYUf2f2PgMsLNvgwjAio=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qMXZ9-0008DT-AE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 17:35:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E1D7920505;
 Thu, 20 Jul 2023 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689874538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bx1yg3Jg+5Ltd8iqCFWRF8VuzeM7HV3z2vdytiQt5Yk=;
 b=PngWjs3AoBtc3UEXbsy4RXLMM+WwOXtOaETHMIKlObHITJNGj7FJZ4hPCKD54JDAk2nJAl
 pyA292JTp9N3ZP9LM60TZTYUWN5nLNFtfQnof0FRIZoLnjFItINkAuqulTEQVY9W8y/7TP
 Zjuj5PDDl3oZ08U1lzw77D6gIfjSvkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689874538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bx1yg3Jg+5Ltd8iqCFWRF8VuzeM7HV3z2vdytiQt5Yk=;
 b=xDCGVMAH4W5xpkJ3rw9cFHAVYgMRGr7QKLXhNDzAp/DC3RLxIESyxmyLvuLH96tj0bygov
 FqHF7Y/pNcuJo2Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6C48133DD;
 Thu, 20 Jul 2023 17:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bnjlImpwuWSLVQAAMHmgww
 (envelope-from <krisman@suse.de>); Thu, 20 Jul 2023 17:35:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Organization: SUSE
References: <20230719221918.8937-1-krisman@suse.de>
 <20230720074318.GA56170@sol.localdomain>
Date: Thu, 20 Jul 2023 13:35:37 -0400
In-Reply-To: <20230720074318.GA56170@sol.localdomain> (Eric Biggers's message
 of "Thu, 20 Jul 2023 00:43:18 -0700")
Message-ID: <87y1ja4hau.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> writes: >> Another problem
 exists when turning a negative dentry to positive. If >> the negative dentry
 has a different case than what is currently being >> used for lookup, the
 dentry cannot be reused withou [...] 
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
X-Headers-End: 1qMXZ9-0008DT-AE
Subject: Re: [f2fs-dev] [PATCH v3 0/7] Support negative dentries on
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

>> Another problem exists when turning a negative dentry to positive.  If
>> the negative dentry has a different case than what is currently being
>> used for lookup, the dentry cannot be reused without changing its name,
>> in order to guarantee filename-preserving semantics to userspace.  We
>> need to either change the name or invalidate the dentry. This issue is
>> currently avoided in mainline, since the negative dentry mechanism is
>> disabled.
>
> Are you sure this problem even needs to be solved?

Yes, because we promise name-preserving semantics.  If we don't do it,
the name on the disk might be different than what was asked for, and tools
that rely on it (they exist) will break.  During initial testing, I've
had tools breaking with case-insensitive ext4 because they created a
file, did getdents and wanted to see exactly the name they used.

> It actually isn't specific to negative dentries.  If you have a file "foo"
> that's not in the dcache, and you open it (or look it up in any other way) as
> "FOO", then the positive dentry that gets created is named "FOO".
>
> As a result, the name that shows up in /proc/$pid/fd/ for anyone who has the
> file open is "FOO", not the true name "foo".  This is true even for processes
> that open it as "foo", as long as the dentry remains in the dcache.
>
> No negative dentries involved at all!

I totally agree it is goes beyond negative dentries, but this case is
particularly important because it is the only one (that I know of) where
the incorrect case might actually be written to the disk.  other cases,
like /proc/<pid>/fd/ can just display a different case to userspace,
which is confusing.  Still, the disk has the right version, exactly as
originally created.

I see the current /proc/$pid/fd/ semantics as a bug. In fact, I have/had
a bug report for bwrap/flatkpak breaking because it was mounting
something and immediately checking /proc/mounts to confirm it worked.  A
former team member tried fixing it a while ago, but we didn't follow up,
and I don't really love the way they did it.  I need to look into that.

> Or, it looks like the positive dentry case is solvable using d_add_ci().
> So maybe you are planning to do that?  It's not clear to me.

I want to use d_add_ci for the future, yes. It is not hard, but not
trivial, because there is an infinite recursion if d_add_ci uses
->d_compare() when doing the lookup for a duplicate.  We sent a patch to
fix d_add_ci a while ago, but it was rejected.  I need to revisit.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
