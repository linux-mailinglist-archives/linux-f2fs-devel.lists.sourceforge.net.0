Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A083C8CF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 17:55:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT30a-0001qb-OQ;
	Thu, 25 Jan 2024 16:55:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rT30Y-0001qV-GF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 16:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MqyFwT/zF35b3QEIc+pC02CwmxeyFqwYPps3QzTYVw4=; b=VTLyiScvfWRcLH9RruYZNsJg1N
 /dIKVn05a57G+r83QfZqSMa5z96HbRDJT8g2pXJbgre0ESMNVEwZe+GFX7GdPGjq1il81T5RpAZdo
 ird0mcAlOhamGHlnzWnT3jDVD2rmbDJ12/ElLyWfxZvAHLpotmw4AMj13r/u7IZOGfyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MqyFwT/zF35b3QEIc+pC02CwmxeyFqwYPps3QzTYVw4=; b=Udog43VnvofkRbNMwSvZRXhI0v
 LO/M6EqYkChqowVLZUQOy9azskp/TWV1KMqnP5XdsBKqLJQXpa4rDxN0LA8pfrwuW6Icioa64r1Dh
 COUmD8JlcwUGd6fGjg1GmIxDEqqny7PTUbrkHmPVMPJWQzLly//E6yhuwcPmSI6uNrXM=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rT30V-00065t-Aa for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 16:55:19 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B33B71F8AB;
 Thu, 25 Jan 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706201703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqyFwT/zF35b3QEIc+pC02CwmxeyFqwYPps3QzTYVw4=;
 b=ZN6cYtR+uVMFCmxJ2DYwzWhKfe2BVsc2IHcvHk/edLcSia7gmN76vOX3FtbNOGJF45uxlE
 ouQg9ygNmKrOj7QCpCdmdOIQI/O/phFk/1jphpvhWwfUiTm6/4rUy6TlAfwU8H7VY68b1w
 jZWZeRBms9nAqkPwvHnn11pLJgiYHK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706201703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqyFwT/zF35b3QEIc+pC02CwmxeyFqwYPps3QzTYVw4=;
 b=yzXOPLtF4FhYk84PWdhMgoMRbh1X73RvUIYnIYAC5S//8C1S3Tn3+CxuuUe6Xds0BAWHUq
 ixpCU8TM6kG32MAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706201703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqyFwT/zF35b3QEIc+pC02CwmxeyFqwYPps3QzTYVw4=;
 b=ZN6cYtR+uVMFCmxJ2DYwzWhKfe2BVsc2IHcvHk/edLcSia7gmN76vOX3FtbNOGJF45uxlE
 ouQg9ygNmKrOj7QCpCdmdOIQI/O/phFk/1jphpvhWwfUiTm6/4rUy6TlAfwU8H7VY68b1w
 jZWZeRBms9nAqkPwvHnn11pLJgiYHK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706201703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MqyFwT/zF35b3QEIc+pC02CwmxeyFqwYPps3QzTYVw4=;
 b=yzXOPLtF4FhYk84PWdhMgoMRbh1X73RvUIYnIYAC5S//8C1S3Tn3+CxuuUe6Xds0BAWHUq
 ixpCU8TM6kG32MAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DB83134C3;
 Thu, 25 Jan 2024 16:55:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZdLPNWaSsmX1AwAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 25 Jan 2024 16:55:02 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240125025115.GA52073@sol.localdomain> (Eric Biggers's message
 of "Wed, 24 Jan 2024 18:51:15 -0800")
Organization: SUSE
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-2-krisman@suse.de>
 <20240125025115.GA52073@sol.localdomain>
Date: Thu, 25 Jan 2024 13:55:00 -0300
Message-ID: <87jznxs68r.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZN6cYtR+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yzXOPLtF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.04 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,vger.kernel.org,lists.sourceforge.net,gmail.com];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.53)[80.60%]
X-Spam-Score: -2.04
X-Rspamd-Queue-Id: B33B71F8AB
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Jan 19, 
 2024 at 03:47:33PM -0300,
 Gabriel Krisman Bertazi wrote: >> ovl: Reject mounting
 case-insensitive filesystems > > Overlayfs doesn't mount filesystems. I think
 you might mean somethin [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT30V-00065t-Aa
Subject: Re: [f2fs-dev] [PATCH v3 01/10] ovl: Reject mounting
 case-insensitive filesystems
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

> On Fri, Jan 19, 2024 at 03:47:33PM -0300, Gabriel Krisman Bertazi wrote:
>> ovl: Reject mounting case-insensitive filesystems
>
> Overlayfs doesn't mount filesystems.  I think you might mean something like
> reject case-insensitive lowerdirs?

uppers and workdir too. I'd make this:

  "ovl: Reject mounting over case-insensitive filesystems"

>
>> +	/*
>> +	 * Root dentries of case-insensitive filesystems might not have
>> +	 * the dentry operations set, but still be incompatible with
>> +	 * overlayfs.  Check explicitly to prevent post-mount failures.
>> +	 */
>> +	if (sb_has_encoding(path->mnt->mnt_sb))
>> +		return invalfc(fc, "case-insensitive filesystem on %s not supported", name);
>
> sb_has_encoding() doesn't mean that the filesystem is case-insensitive.  It
> means that the filesystem supports individual case-insensitive
> directories.
>
> With that in mind, is this code still working as intended?
>

Yes, it is. In particular, after the rest of the patchset, any dentry
will be weird and lookups will throw -EREMOTE.

> If so, can you update the comment and error message accordingly?

I'm not sure how to change and still make it readable by users.  How about:

  return invalfc(fc, "case-insensitive capable filesystem on %s not supported", name);

what do you think?

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
