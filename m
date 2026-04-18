Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGTSA1za4mn//AAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Apr 2026 03:11:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0741F922
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Apr 2026 03:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqX8AWECNYx30C+excHYepKqfrLP6U/NMQPfV/GHGFY=; b=SjWndbevUlpri2w+nkYN7YbTi0
	1PCxIqgBxeYRVzp0PwUraLKs5OemcNVuzXluKv3Z8xpDpg/mtQWoPwBVLiz7YYSXnEa375PqL0Qpt
	fs0XMaFFxAQ7eV+qmXIsE40g9oTUqyarQ/tiZ93gAOfZpoFOowU2zWwRxQW0BKttwoYo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDuDn-00054u-Bu;
	Sat, 18 Apr 2026 01:11:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wDuDl-00054f-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 01:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ve73Vp/5lkh8fc1KpsVy8xKyWQr1Qnoq3EEd6VeXpU4=; b=VHABc1bXAuroB93LN6N9SQzFYu
 6qMtyloddDtbMMlqof7Zp4s+/CVh7cBh+T0UvTLU0bxuFNlXRfgHFd+06jDXa2/j+/Wu6BFqSxut5
 W4Nd2VzAdiYhU4oBsDkLq5mowscFJRXOOV7cMr/F+ZCpmM3aUXBddmGQpN+ZUQRMgZEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ve73Vp/5lkh8fc1KpsVy8xKyWQr1Qnoq3EEd6VeXpU4=; b=S6MEjmp/U6etBVPdhy7zVCVCEk
 PZo6F/YCXVbtmN7+b6ONU3gdOulPeYhz9Z4Su65zNY7ljYero9Mz+E1hP2mx06/TKg/w4viseztYw
 44boISmWYa1OzQUEZmry5GPswF39wNhLKBFjVINutqxIhirUgCZH2YsGMikKmioaOXfE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDuDl-0004rb-Mb for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 01:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 558F840561;
 Sat, 18 Apr 2026 01:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3C9C19425;
 Sat, 18 Apr 2026 01:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776474691;
 bh=xtf3vTf3zLGn0bILHEOozeTiSY3t0wOv4YnFQqyE4Dk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iay4PWySfnfz1NnT6IMCkSaoeThC1GwrsgYABhEiUGyxKSASfA+PXjrKlMbFYO6FO
 7FhUqJeHBJdh04je2/wPocw4pOYLtnAQlkpJ+rVidfuXDKV5pb34ke3EQZBTKcfcxt
 aV75FvnnbopL/HP3DRpF1L3SVQKCEZe0zUvMbDKg0OQC0IB8eUjTExpodPwsBAdQHu
 Ye1O5IMs/hRrbsg8xFsPylxSnDA0Nwkzh376ON3+5tr6CU5nIAsodFUTcfgnc+awru
 HuI+Ua0TVITltwWLty3blu+g/qk+3UEXNQ0o2TY+iAeOyemd7q9eN4uwCWi0oquNP+
 TEELTW40C81Jg==
Message-ID: <7c6f4134-b01c-4ec6-a036-d92c5336839c@kernel.org>
Date: Sat, 18 Apr 2026 09:11:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com>
Content-Language: en-US
In-Reply-To: <adhPZxtbZxgU-37v@google.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/10/2026 9:16 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > enum { > F2FS_XATTR_FADV_LARGEFOLIO, > };
 > > unsigned int value = BIT(F2FS_XATTR_FADV_LARGEFOLIO); 
 > > 1. setxattr(file, "user.fadvise" [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDuDl-0004rb-Mb
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Akilesh Kailash <akailash@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:akailash@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: A6F0741F922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/2026 9:16 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> enum {
>         F2FS_XATTR_FADV_LARGEFOLIO,
> };
> 
> unsigned int value = BIT(F2FS_XATTR_FADV_LARGEFOLIO);
> 
> 1. setxattr(file, "user.fadvise", &value, sizeof(unsigned int), 0)
>   -> register the inode number for large folio
> 2. chmod(0400, file)
>   -> make Read-Only
> 3. fsync() && close() && open(READ)
>   -> f2fs_iget() with large folio
> 4. open(WRITE), mkwrite on mmap, chmod(WRITE)
>   -> return error
> 5. close() and open()
>   -> goto #3
> 6. unlink
>   -> deregister the inode number
> 
> Suggested-by: Akilesh Kailash <akailash@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
