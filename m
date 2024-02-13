Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 471218535B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 17:09:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZvLg-0007Ch-WF;
	Tue, 13 Feb 2024 16:09:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rZvLe-0007Cb-D7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 16:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zubravQy7jVbUoW/ZL/MweR2V9SuJRaNpDAgWH+si7c=; b=H1XsTuCR+tefHNP+L4T0m6F3mC
 Ql7GtVt3pCCZq6XCylM+33D42TZyUBh7tSek98xELQ5ujYCeD9ROfvv1W7pC8/IHsLmsq+sIslInO
 yJfM/GSD4zNswFw56mbJIvb355F6F1cnBz4YfdsBUZA6wAuZ7ptIM2yhBHE74coha8OU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zubravQy7jVbUoW/ZL/MweR2V9SuJRaNpDAgWH+si7c=; b=Qc25Mdki65etN+8/P6IsXoumVC
 mh/+AzMi7pJHxS1KOKjZxz8T/kpr7fFHVawOkDUlONvR3KUYSbvweii1IAjWbdVTuvd2OOSTxj72M
 mSpyulJFkN/2JDd/tVArFKAtbNfEuEV010fQsbEnovhJjq37ivAOEH9Eqj646JHbuoUE=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rZvLd-00070T-0a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 16:09:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BCF221C42;
 Tue, 13 Feb 2024 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707840558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zubravQy7jVbUoW/ZL/MweR2V9SuJRaNpDAgWH+si7c=;
 b=NrQsyi7eL0Z8MNW3teN7s7NjS59N9Cv5z81m8t+3jwF++XZK/cJAMx9lQsQ8eXjKHKtPhE
 WLIYfwWxxH6j/MgaeVK0xr43Gin/lx7FIAo9zUXS2+cIdLf8nDBSAS5i5Oawrzei5zA7wC
 Z3ajU2KtGeGno1pzikYmBgnvjgaYeSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707840558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zubravQy7jVbUoW/ZL/MweR2V9SuJRaNpDAgWH+si7c=;
 b=oTK1LIk883C4Bl1hG5vCRjrkMxD6cI6iRlY7IzZeyJHztiGOfgHWgulmR8O0JFT/0/m6BM
 NoIt2VnzNXQ+tJCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707840558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zubravQy7jVbUoW/ZL/MweR2V9SuJRaNpDAgWH+si7c=;
 b=NrQsyi7eL0Z8MNW3teN7s7NjS59N9Cv5z81m8t+3jwF++XZK/cJAMx9lQsQ8eXjKHKtPhE
 WLIYfwWxxH6j/MgaeVK0xr43Gin/lx7FIAo9zUXS2+cIdLf8nDBSAS5i5Oawrzei5zA7wC
 Z3ajU2KtGeGno1pzikYmBgnvjgaYeSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707840558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zubravQy7jVbUoW/ZL/MweR2V9SuJRaNpDAgWH+si7c=;
 b=oTK1LIk883C4Bl1hG5vCRjrkMxD6cI6iRlY7IzZeyJHztiGOfgHWgulmR8O0JFT/0/m6BM
 NoIt2VnzNXQ+tJCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC40D1370C;
 Tue, 13 Feb 2024 16:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ArjcJy2Uy2VkSwAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 13 Feb 2024 16:09:17 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <1b7d51df-4995-4a4a-8ec4-f1ea4975e44c@collabora.com> (Eugen
 Hristev's message of "Tue, 13 Feb 2024 06:44:16 +0200")
Organization: SUSE
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
 <20240208064334.268216-2-eugen.hristev@collabora.com>
 <87ttmivm1i.fsf@mailhost.krisman.be>
 <ff492e0f-3760-430e-968a-8b2adab13f3f@collabora.com>
 <87plx5u2do.fsf@mailhost.krisman.be>
 <1b7d51df-4995-4a4a-8ec4-f1ea4975e44c@collabora.com>
Date: Tue, 13 Feb 2024 11:09:16 -0500
Message-ID: <875xyse47n.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NrQsyi7e;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oTK1LIk8
X-Spamd-Result: default: False [-1.66 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-1.35)[90.50%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0BCF221C42
X-Spam-Level: 
X-Spam-Score: -1.66
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > On
 2/9/24 16:40,
 Gabriel Krisman Bertazi wrote: >> Eugen Hristev <eugen.hristev@collabora.com>
 writes: > With the changes you suggested, I get these errors now : > > [
 107.409410] EXT4-fs error (dev [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rZvLd-00070T-0a
Subject: Re: [f2fs-dev] [RESEND PATCH v9 1/3] libfs: Introduce
 case-insensitive string comparison helper
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 Eric Biggers <ebiggers@google.com>, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> On 2/9/24 16:40, Gabriel Krisman Bertazi wrote:
>> Eugen Hristev <eugen.hristev@collabora.com> writes:
> With the changes you suggested, I get these errors now :
>
> [  107.409410] EXT4-fs error (device sda1): ext4_lookup:1816: inode #521217: comm
> ls: 'CUC' linked to parent dir
> ls: cannot access '/media/CI_dir/CUC': Structure needs cleaning
> total 8
> drwxr-xr-x 2 root root 4096 Feb 12 11:51 .
> drwxr-xr-x 4 root root 4096 Feb 12 11:47 ..
> -????????? ? ?    ?       ?            ? CUC
>
> Do you have any idea about what is wrong ?

Hm, there's a bug somewhere. The lookup got broken and ls got an error.
Did you debug it a bit?  can you share the code and a reproducer?

From a quick look at the example I suggested, utf8_strncasecmp* return 0
on match, but ext4_match should return true when matched. So remember to
negate the output:

...
res = !utf8_strncasecmp(um, name, &dirent);
...

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
