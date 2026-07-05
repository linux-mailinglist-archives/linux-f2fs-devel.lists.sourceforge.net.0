Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gp8tH2m8SmrHGwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 05 Jul 2026 22:19:53 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0570B500
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 05 Jul 2026 22:19:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=S3JqTYCt;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=jYjGzMuE;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=HPv8+i+L;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ZIga6IiU;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PXSDzWEi379cfx2HjMYoktnqopj/ClJtaMlU7mdAaw=; b=S3JqTYCt0DhwMJdxvSEcLx9K26
	sfrCzxnYvHvYMQw5P1EGbqq03zqb+SjW/7XeLI1V5Ffh3nzQYa2HyOkb1KQQvm1z2sxzCv0FePNDH
	rKsn1B+riiFSR8adHnRlUAQlMsMUeKpKyK07E8Jd1gRUkAjWgDnnQMlNOja7/9untqYo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgTJd-0006iz-Df;
	Sun, 05 Jul 2026 20:19:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wgTJc-0006it-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 05 Jul 2026 20:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ut7iHQF/AbxXgauDKV+8ArFS+YsvVMBn1LLgz1WNd1w=; b=jYjGzMuEfAKHYBmS6H8teKszAu
 PmO8HB/LcEUSkUG931gqFm6WSQs94iS0pEhyGFzd9nC6Thhm8RVg1tFDmHf/n0tQ666xEqFMU1eOw
 fw5895UmJtMzLWPEUrU+2K65/+/3IPG+Ej0owjz5Lv12UyzUaiP2dHBeNF7UIR4nTKXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ut7iHQF/AbxXgauDKV+8ArFS+YsvVMBn1LLgz1WNd1w=; b=HPv8+i+LsOsv5R0nui/jJ1/ctb
 2gXZB+999ZHrEjWbJTc31pVsgNZyFU09/zVCz3xtl4GdLG8Yniqp5BJy/4WlPElya6Qq2JIWnzcjW
 UjTwDQOG37AiISe1gfddY/WAl32kflacLrGaDtmXj02RzL+Waium+c/ghRCO6fnrSb5U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgTJZ-0007Os-1i for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 05 Jul 2026 20:19:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DF5CE60018;
 Sun,  5 Jul 2026 20:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B011F000E9;
 Sun,  5 Jul 2026 20:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783282779;
 bh=ut7iHQF/AbxXgauDKV+8ArFS+YsvVMBn1LLgz1WNd1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZIga6IiUpJDUov9sJrPSs0xrW+7w/Lo594hWKveoTRiueAcCmhDHGWuoNhKW9m4s7
 KEgUnSAZ12+Ucc+thyl9NcQvL08y8NNwmOh7id67QWB8dePRqmD7kN7kcwq+niA2vn
 dPYO6X+jHzrdGsiugS9gXZ4RHea27n/AGJxRUdsmKgKF6CcgiGb4/m3+N7/Bk8CcDG
 F7yt2a/iTpdVSBl099lqGKINf5Iqg7enT+AZGz9UR3Du9wPVx+6MWV26Du56BgqXxB
 GuY4szfcpBZ3nW8mM9G9a5Q7V7CeHJEypgl31f5Gvdypblqk+0aANDO6HwishVmZFJ
 T9RwWKuveNRWA==
Date: Sun, 5 Jul 2026 13:19:37 -0700
To: linux-fscrypt@vger.kernel.org
Message-ID: <20260705201937.GI41916@quark>
References: <20260705194555.75030-1-ebiggers@kernel.org>
 <20260705194555.75030-14-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260705194555.75030-14-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jul 05, 2026 at 12:45:50PM -0700, Eric Biggers wrote:
 > On block-based filesystems, fscrypt file contents encryption is now > always
 implemented using blk-crypto. This implementation supports [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wgTJZ-0007Os-1i
Subject: Re: [f2fs-dev] [PATCH v2 13/17] fscrypt: Remove
 fscrypt_dio_supported()
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:riteshlist@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lst.de:email,quark:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22B0570B500

On Sun, Jul 05, 2026 at 12:45:50PM -0700, Eric Biggers wrote:
> On block-based filesystems, fscrypt file contents encryption is now
> always implemented using blk-crypto.  This implementation supports
> direct I/O.
> 
> Therefore, fscrypt_dio_supported() now always returns true, except in
> the edge case where statx(STATX_DIOALIGN) is called on an encrypted
> regular file that hasn't had its key set up.  But that was really a
> workaround rather than the desired behavior, so we can disregard it.
> 
> Thus, fscrypt_dio_supported() is no longer needed.  Remove it.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Sashiko pointed out that the following comment in ext4_getattr() (and
also in f2fs_getattr()) becomes outdated and should be updated too:

/*
 * Return the DIO alignment restrictions if requested.  We only return   
 * this information when requested, since on encrypted files it might    
 * take a fair bit of work to get if the file wasn't opened recently.    
 */

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
