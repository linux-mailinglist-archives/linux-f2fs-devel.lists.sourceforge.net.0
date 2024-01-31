Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B808431F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 01:32:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUyWI-0006ha-R3;
	Wed, 31 Jan 2024 00:32:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUyWA-0006hH-Sc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 00:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/vilI7G8lL/UQ/kgBn//rsDqRLdTHE2OvPGJf/lKhcI=; b=VyGxYXDgKhjxkWdDqhJ65DVFiO
 l9+x/fFytpf/ZokD6oTryCxgn1ZJjJOm6t8HTcQq16XjoNuJs7a+bQYFzvP4QMj4GTUYMYJrvD0H8
 1qVlzgS/oxh98eb2DzUk2QXScK12tsIf1jxRaIWAa/3nLUCQSoN2ZjdHOZe0WkejGTB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/vilI7G8lL/UQ/kgBn//rsDqRLdTHE2OvPGJf/lKhcI=; b=W6RtST1csfnkeRX4N/L3OGkkfE
 q8Ss9PUHyEkEUBCLu5/zMAJ/RN68Ka+Vlql0W0wGQIz4zLWQf7zGjFpY2/9LI8WOJZklxMBx5Phy8
 xBv3O48zW2AJ0LWPgpaHY+Z0sKsyY5DE7R03036uUGDmTZOm49REfEdvsP2bMmmrbv9M=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUyW5-0002Ro-OF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 00:31:54 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75AA8220A0;
 Wed, 31 Jan 2024 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706661103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vilI7G8lL/UQ/kgBn//rsDqRLdTHE2OvPGJf/lKhcI=;
 b=o6Bpqu9INmzBfg3XWQ+3Vwf7dMtTEJjAtTd09dmU6QEBblg9hFHNK4mZ5KM7P8p8ARaw0d
 hgXFLp/ltewhmOXcLVCIp1MFW0IGsyb2umptBNQIs1fCSfqVdtb/E9keVAuJcfEheOBFbf
 rp94R7ASZYdek9lS5NXlQsckZYl3PvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706661103;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vilI7G8lL/UQ/kgBn//rsDqRLdTHE2OvPGJf/lKhcI=;
 b=qRcKcm/e/cqK0+ouUDJb3P3RH5IZ5az1RxFYH0qpUuMuEOfdg4/ukyWeXT330afsm4p3pj
 wZvpOP9AF3BvT0Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706661103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vilI7G8lL/UQ/kgBn//rsDqRLdTHE2OvPGJf/lKhcI=;
 b=o6Bpqu9INmzBfg3XWQ+3Vwf7dMtTEJjAtTd09dmU6QEBblg9hFHNK4mZ5KM7P8p8ARaw0d
 hgXFLp/ltewhmOXcLVCIp1MFW0IGsyb2umptBNQIs1fCSfqVdtb/E9keVAuJcfEheOBFbf
 rp94R7ASZYdek9lS5NXlQsckZYl3PvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706661103;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vilI7G8lL/UQ/kgBn//rsDqRLdTHE2OvPGJf/lKhcI=;
 b=qRcKcm/e/cqK0+ouUDJb3P3RH5IZ5az1RxFYH0qpUuMuEOfdg4/ukyWeXT330afsm4p3pj
 wZvpOP9AF3BvT0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8634139B1;
 Wed, 31 Jan 2024 00:31:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7cH2I+6UuWXqbAAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 31 Jan 2024 00:31:42 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240131002258.GA2020@sol.localdomain> (Eric Biggers's message
 of "Tue, 30 Jan 2024 16:22:58 -0800")
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-2-krisman@suse.de>
 <20240131002258.GA2020@sol.localdomain>
Date: Tue, 30 Jan 2024 21:31:40 -0300
Message-ID: <87plxi2vir.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o6Bpqu9I;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="qRcKcm/e"
X-Spamd-Result: default: False [-2.34 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.03)[56.07%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 75AA8220A0
X-Spam-Level: 
X-Spam-Score: -2.34
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Mon, Jan 29, 
 2024 at 05:43:19PM -0300,
 Gabriel Krisman Bertazi wrote: >> ovl: Reject mounting
 over case-insensitive directories > > Maybe: > > ovl: Reject mounting over
 rootdir of case-insensitiv [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUyW5-0002Ro-OF
Subject: Re: [f2fs-dev] [PATCH v5 01/12] ovl: Reject mounting over
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Mon, Jan 29, 2024 at 05:43:19PM -0300, Gabriel Krisman Bertazi wrote:
>> ovl: Reject mounting over case-insensitive directories
>
> Maybe:
>
>     ovl: Reject mounting over rootdir of case-insensitive capable FS
>
> or:
>
>     ovl: Always reject mounting over case-insensitive directories
>
> ... since as your commit message explains, overlayfs already does reject
> mounting over case-insensitive directories, just not in all cases.
>
>> Since commit bb9cd9106b22 ("fscrypt: Have filesystems handle their
>> d_ops"), we set ->d_op through a hook in ->d_lookup, which
>> means the root dentry won't have them, causing the mount to accidentally
>> succeed.
>
> But this series changes that.  Doesn't that make this overlayfs fix redundant?
> It does improve the error message, which is helpful, but your commit message
> makes it sound like it's an actual fix, not just an error message improvement.

Yes, this series will make it redundant.  But Christian Brauner had
suggested we make this verification explicit instead of relying on d_ops
being set, to avoid future changes breaking this again.  I found the
issue in ovl during testing of v2 and intended to send it separately for
-rc7, but Amir asked it to be sent as part of this series.  And also the
error code is improved.

Anyway, I'll can make this clear in the commit message

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
