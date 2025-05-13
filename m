Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C121AB4ABA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 07:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3A/tVpg1XB9Hino+830izUooJNJ3su6R4vOn1l/Bh68=; b=fXYDVQVoQGF3AA4nfhkFe4tZjk
	MOQrA8FJBskHxSI8xVL90r8kP4vXHGs9LFmS83/98uUZHqUIIx3zUsteV2eFYZIlFuT2kHoU09fsN
	JEy3FmTCmjwBGS/ZDiFhuxB4u6FOwpKDN9WZhN/WEr2kRMLYcIATysMLhPq3dY9+efqA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEhpU-0002g7-6L;
	Tue, 13 May 2025 05:05:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ddiss@suse.de>) id 1uEhpL-0002fv-FR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1w0nmxjfSTrHPkRrAIU4rBHDXg60KKtX6FQe4+/vpsw=; b=LchnFvU5tA8L18jk3yOvHXPIDi
 0XHYD/eWQHNGlnq04lpyA/nJUsV8oLQAI+tnLj/6GPwNK3w719XTMKDKTu9x6MoX0/F3mGjlmICCt
 04wvxRJMgNE+mu1ta/SHslY3Lnx1/26XFY0wOleODYuvXYR1Yb24C28rCWGOa6UIG3l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1w0nmxjfSTrHPkRrAIU4rBHDXg60KKtX6FQe4+/vpsw=; b=WYrVOzspNx411kd/oJslTiPVh9
 /kRIR9WZQ4HMLaBtdw/QKLwQXZ9vGJk3z7kG1cujtnjPuSFgh5AHHsK2ZnvD//qzy0X387FLAOA99
 KcdLTTKc3KcCPT8WMObP4EON8OYL2PXmcrLGryy9J+dK9aLheKbLknZUZShdf1K67yn4=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uEhpH-0005FU-8S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 05:05:15 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A7BB61F387;
 Tue, 13 May 2025 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747112699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1w0nmxjfSTrHPkRrAIU4rBHDXg60KKtX6FQe4+/vpsw=;
 b=JyaTaMBAr8UgiCtG5TXKyuD0ygVgrdyW21fCG64vncwJQHPyh276W3ftbpU9cl03qNHAru
 p7dZL0yVCkEpLaAfTZn/UwOo2GITgzu8PUEAU1807u9Q3WL1rxc3lR9WpT9M0I7LC2piCS
 gnT120gY8BGp0aJ/p++5d8zaJ1ke914=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747112699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1w0nmxjfSTrHPkRrAIU4rBHDXg60KKtX6FQe4+/vpsw=;
 b=EvCDBuOy22GeSrafV/M5tqGMSvpz3+q+Wz//0RpeFTH0kVyo81p9FUWJupj3Mrrf9GExvW
 2w5Evof8uwwnpZCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747112699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1w0nmxjfSTrHPkRrAIU4rBHDXg60KKtX6FQe4+/vpsw=;
 b=JyaTaMBAr8UgiCtG5TXKyuD0ygVgrdyW21fCG64vncwJQHPyh276W3ftbpU9cl03qNHAru
 p7dZL0yVCkEpLaAfTZn/UwOo2GITgzu8PUEAU1807u9Q3WL1rxc3lR9WpT9M0I7LC2piCS
 gnT120gY8BGp0aJ/p++5d8zaJ1ke914=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747112699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1w0nmxjfSTrHPkRrAIU4rBHDXg60KKtX6FQe4+/vpsw=;
 b=EvCDBuOy22GeSrafV/M5tqGMSvpz3+q+Wz//0RpeFTH0kVyo81p9FUWJupj3Mrrf9GExvW
 2w5Evof8uwwnpZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 511A81386D;
 Tue, 13 May 2025 05:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HDKSAvnSImhrLAAAD6G6ig
 (envelope-from <ddiss@suse.de>); Tue, 13 May 2025 05:04:57 +0000
Date: Tue, 13 May 2025 15:04:47 +1000
From: David Disseldorp <ddiss@suse.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250513150447.70f61c98.ddiss@suse.de>
In-Reply-To: <20250509060754.1677062-1-chao@kernel.org>
References: <20250509060754.1677062-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 9 May 2025 14:07:54 +0800, Chao Yu wrote: > This is
 a regression testcase to check whether we will handle database > inode dirty
 status correctly: > 1. mount f2fs image w/ timeout fault injection option
 > 2. create a regular file, and write d [...] 
 Content analysis details:   (-2.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
X-Headers-End: 1uEhpH-0005FU-8S
Subject: Re: [f2fs-dev] [PATCH v3] f2fs/013: test to check potential
 corruption on atomic_write file
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
Cc: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>,
 Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri,  9 May 2025 14:07:54 +0800, Chao Yu wrote:

> This is a regression testcase to check whether we will handle database
> inode dirty status correctly:
> 1. mount f2fs image w/ timeout fault injection option
> 2. create a regular file, and write data into the file
> 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> 4. write transaction data to the file
> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> 6. meanwhile loop call fsync in parallel
> Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
> file"), database file may become corrupted after atomic write while
> there is concurrent dirty inode flush in background.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

Looks good.
Reviewed-by: David Disseldorp <ddiss@suse.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
