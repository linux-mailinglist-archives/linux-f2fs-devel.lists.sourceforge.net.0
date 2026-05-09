Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B8IFRTx/mkdzwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 10:32:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E45EB4FEB1B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 10:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAYdX+UCNB2o9ZNpjfzn83/dXJ+4xQ7yLpo70N7H2F0=; b=I5Fi6rjjvIDxMLpzTeYe3QG3zo
	287q9rm4lpEdkMfQWDlR8NWH6USRAYAmm5JbyXUA41l2i6NYhw7Im1zx3BaM2glUEpvsJMUMkA0EC
	P6J1mT1Hlg187YPHcgm6uE2cKvpzbkkRE1YwOc3VuJLrQYB2xYfmoda6uv3KYqSEB85w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLd6X-0000sv-M1;
	Sat, 09 May 2026 08:32:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wLd6W-0000sk-HX
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 08:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4qORPa67BPTFghrS+GzCUE5Kgupq12RTbhAoIyfhaQ=; b=CL7ayt0i8tapHHMIDe0t37eLNu
 ufRE+GF1riSDFunCYHMzorKs1AW42Ge6b4JC40kfKLoA8uyohM0Ec7prXYxxJGEclDnDCTUS8d2IB
 /7jsjlVYHSMj9GykpL0BAPvhxzF67MTq9TJwpzvmsW+h1lc8M2T2kti2q/23L+YlVrEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u4qORPa67BPTFghrS+GzCUE5Kgupq12RTbhAoIyfhaQ=; b=MTm6iB8Hj/ytJAjnjmvi22mk4S
 Db8gyUvHvjUzMB88kZeAOh8J0gfmA738ql5+ynXXnWZ2Kpg1/ufr7t2CHgTbKG4dYJ4bHG9/73vlb
 KtcADU0DHpvq836LJtfytjOog5oyXVBPWQsCUDXJP4cKcOOa9BxE665lGx36MMenJMpM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLd6V-0005FN-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 08:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 357BC43267;
 Sat,  9 May 2026 08:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EDEC2BCB2;
 Sat,  9 May 2026 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778315522;
 bh=0bdQQ2wA5FedFLaMxTyI9ncfC/Fm4fJDrtT7xGwnJxM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Cmk0tDqgirLVPS3IYvDAHmbgHp/Oil3qwZygeoMmqb+YTjj+RkXh6I2TmUmz9/JtK
 1Z9YvnoYQQVZnLENtLbkRBUUJww4G0C/VOogkxRvGWDcYycnD/YRrdCNGGtp2KjiFq
 WeMQlmjgjPME8ye7v2NQhc0hy0HL7CsCbkqTqch3zPpDvvIDbGE2osFShjDBsp/0Z6
 22Yos+i1679BjJ3xMH50pYAHsC4XD+TIG0+YTgxp0N3MlOE8RlgfubUDJKrA/Vcj/Q
 OxdnQA4QMkgtBqC6jkXgBeT/e81JE59pumnFIbWChNsUaX5ieHfelRpZ+hiTcPubQj
 SPes+efQ03gTg==
Message-ID: <c7717c73-550d-46d3-9c12-7826e55f73e7@kernel.org>
Date: Sat, 9 May 2026 16:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20260428022440.2481342-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20260428022440.2481342-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/28/26 10:24, Joanne Chang wrote: > Currently, f2fs/022
 and f2fs/023 only clears MKFS_OPTIONS. This causes > the tests to fail when
 leftover MOUNT_OPTIONS depend on unapplied > MKFS_OPTIONS. So MO [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wLd6V-0005FN-Mp
Subject: Re: [f2fs-dev] [PATCH v1] f2fs/{022,
 023}: clear MOUNT_OPTIONS alongside MKFS_OPTIONS
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: E45EB4FEB1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joannechien@google.com,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 4/28/26 10:24, Joanne Chang wrote:
> Currently, f2fs/022 and f2fs/023 only clears MKFS_OPTIONS. This causes
> the tests to fail when leftover MOUNT_OPTIONS depend on unapplied
> MKFS_OPTIONS. So MOUNT_OPTIONS should also be cleared to ensure reliable
> mounting.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
