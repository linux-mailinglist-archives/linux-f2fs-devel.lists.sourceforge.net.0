Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNW2FrES4WnoogAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2026 18:47:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB76411F7C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2026 18:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9YGZrfBAlM+kvlFFFykplBOKRZGXZgsMRh7+S9nbOY=; b=dYBw7mgm98SrAn+ZvOAuH3sVQ0
	83miR49VX90UrLk5uuLe61P4++BvT4nfFjKNgmkAlLyUjf+xiisWv5mJNBzQvBmvEG6a1KcY3GnQ4
	wIIC+gRmXc9iPjAgZvWBfGM0AnIB7PMiV5u9x1z5lMiIx9zlKgsrvNgx8r6GBi+E2os8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDPsJ-0000jC-2C;
	Thu, 16 Apr 2026 16:47:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zorro.lang@gmail.com>) id 1wDPsI-0000j5-0H
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Apr 2026 16:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fcIYmGJijp1gql4INlwnF9x0hUWvlgCOIk9cRqzHqwc=; b=Qw0tqTGhKOcuhUXqUqwmaKgmC9
 kn9Ty2hKtOPbbbrDcDz5zq2ZxJsHgeKKNBYEM3ANtzscKPegaVvCguH/b3VsaZulIXqxW0bAiISIF
 6l+nUxS3BiCgRRHiAmMVur5TFaRzoeKOIBP597Bi6WxrKg3np+BWwCJwwFlyhm1uYQiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fcIYmGJijp1gql4INlwnF9x0hUWvlgCOIk9cRqzHqwc=; b=TjUAsqC2pWiORpLHilNHIIM/N2
 pudOe01xcqVjyIjeBQx1te2r15snAXmxDBJJ2kCCtmOii3WhzWu7lv22sDpjmrJYQ/uyb0edC5bAj
 Bnt28pG2JvcVcfqwqa99mRyFBbtSoLPJTLBykj8cK5qMQSC45j/b7XvK31PE420gh8Z4=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wDPsH-0002ZU-K7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Apr 2026 16:47:29 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2aaf43014d0so49964675ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Apr 2026 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776358039; x=1776962839; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcIYmGJijp1gql4INlwnF9x0hUWvlgCOIk9cRqzHqwc=;
 b=eHNl+rQKY+JSrOoJ7RiAUFzxfUJt4ms2XcsRDcvkKj8sfDMRp+8E6MPo81Sw6sYDz6
 i/3t2ifrTkbntbHatZNvmyn1fiM0aYDrDBcOIzlVIEN00NGqWCdyYUmT12oB80n95E92
 hOAgISZb7qtsnlyYDuFujtP1adbmCBhgMao6oeKqcwJoOsDIYKd3uWMfUBd+LWr1w5+h
 5u4/+wMoqi6YkN9IT2p4TEhVVsTFgHfzdloqpLT7E1ipOCgALaiNVsmEMSvBc/6nqnEE
 iC9/EDxRqDGdVqVw2sueElUSjEPuNqfZmoPM5jM1ECq+HljHQ9blKldfg7T/P8VOPo3T
 +I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776358039; x=1776962839;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fcIYmGJijp1gql4INlwnF9x0hUWvlgCOIk9cRqzHqwc=;
 b=TIUlD3tM79HHqVlMEuzeB4CQT6ixNo1ogsGXhFxiy3+eX6aqSFIBR4IE8d2MuBbd3+
 1Z4xW3Kpo3NHwpZ2CDbnnuPzCjnkUeSRsI/BxZrDNdARjnuv8PAoJGZsZB9S2/wR4Z+2
 6aJvqxkZPG03m2UXdHZ1DUfIbEeP6/CYRKFRm919ybm4/eTWIFUVm/JTjBbbNnookRNT
 BokSLJwI+Wz5ZX0XiLbvPW0af6KG2Aoe++8NU52bm6jua8h3D6nSJfzbstsLUw3BwT63
 +UaUyCpfe8Z6JLwY1Mn2RQ1U7rAFsex1mmfVdXLoxOy+d8NEERboyTHuMmo0BnYbxM32
 VKig==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ny6lXNaM1gzA7CrbsZ0F60pp7Gc5YHfjxl0kZzPjBFT2e45tlIgtjLjCA24jytr3FxqkjbFZupe/w7dlmSk5x@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwtgNX0s5BtUDzjs+40KBDJs7fHyVeCdguxWlFj7jXxqQ0ZRvPN
 HsDzj3YJr1UUkpu1+uH/NyNxUx4nyay7UNOvYsJNUVEQ3ROdIDQt5V7uRS1FypGddHM=
X-Gm-Gg: AeBDieu+jl1Epst1mD8HbPUBVX5o0vOEZ4DDy/l61qv9pZLdN3qf3x5YzgPLJ5zR0CW
 NH3Xn187WZ7sbDKRD8yIf9PNUEAjX+TRtGMg9bm0EkYonHVPPAsPvLhr3KoRnm1kNB5TU0pvKSQ
 1zeQSo7zJQ7Vsg/5dUkNHeUd9hij3S4LZfoMmqjDprDOksrmtvdzEXI1ItWbXbCV2i3QF56XrVb
 InHTUkoefwPiGKW4B2eLikcG8GH9wmtHQ9wHmFbnDmzRbMmNcJuhLpiCfsZ0bbT4D2RphU0xFct
 +RrDlnIPTIqBenRqypr5XIS5cbYSGgVVcF8M5t9jeyeiIeKbVM9hC9m+tJznbEJjfVvfBbWPLZf
 qnd+uVvj8ZIoUG9MDEDJx7nTME7m4Q9RWbn+69pq2B+V1M77HsyEMdoeCq/kdZR0JnDaX+ECAvO
 /vAsiWjgElVywF4QHyoLnZ
X-Received: by 2002:a17:903:2ac3:b0:2b2:6b58:9317 with SMTP id
 d9443c01a7336-2b2d5a77878mr269003585ad.39.1776358038866; 
 Thu, 16 Apr 2026 09:47:18 -0700 (PDT)
Received: from zlang-mailbox ([64.176.226.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b47810ae96sm78015315ad.21.2026.04.16.09.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 09:47:18 -0700 (PDT)
From: Zorro Lang <zorro.lang@gmail.com>
X-Google-Original-From: Zorro Lang <zlang@kernel.org>
Date: Fri, 17 Apr 2026 00:47:09 +0800
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <aeER8AIJZecuTLIc@zlang-mailbox>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>, 
 Jan Prusakowski <jprusakowski@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, 
 anand.jain@oracle.com, wqu@suse.com
References: <20260410131821.991005-1-jprusakowski@google.com>
 <ad3zThMKaWZ65XE2@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad3zThMKaWZ65XE2@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 14, 2026 at 12:57:02AM -0700, Christoph Hellwig
 wrote: > On Fri, Apr 10, 2026 at 01:18:20PM +0000, Jan Prusakowski wrote:
 > > F2FS uses a checkpoint mechanism for metadata consistency rath [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zorro.lang(at)gmail.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wDPsH-0002ZU-K7
Subject: Re: [f2fs-dev] [PATCH] generic/050: handle f2fs as nojournal
 filesystem
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
Cc: wqu@suse.com, anand.jain@oracle.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.51 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:wqu@suse.com,m:anand.jain@oracle.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zorrolang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zorrolang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 9BB76411F7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:57:02AM -0700, Christoph Hellwig wrote:
> On Fri, Apr 10, 2026 at 01:18:20PM +0000, Jan Prusakowski wrote:
> > F2FS uses a checkpoint mechanism for metadata consistency rather than a
> > traditional journal. Roll-forward recovery is only needed if there are
> > fsync'd files since the last checkpoint.
> > 
> > In this test case, files are created without fsync, so there is no
> > roll-forward data to replay during mount.
> > 
> > Therefore, F2FS does not need to write to the device to recover, and
> > successfully mounts on the read-only block device. Thus, it should be
> > treated as nojournal in this case.
> 
> This looks ok, but I always wonder if we want an opt-in for this
> "journaling" behavior and/or define it clear in common/.

_has_traditional_journal ? _has_journal_replay ? :-D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
