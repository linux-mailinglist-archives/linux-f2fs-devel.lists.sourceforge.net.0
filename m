Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ADrdBO1cS2qUQAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 09:44:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF9D70DBB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 09:44:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VMP9CcdL;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=U5IAzLuN;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=aB3NichN;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=IK6AjMEb;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y71nJFjmYMenFm7qmpIc+Xd0GGaXIeihPG/+sGfK4go=; b=VMP9CcdLdZYOvWh69jV1K8OWvT
	hLIF6v8ha21pDQ3IHi95+FhPTNiMUARqYjK1nY8vCBIIBAbwewghkc7AXDDWVmVOhNMn7aaNinVS9
	iRow3DIbi+0cvkrlGgdEySFOxX2u02mLRO597Etgrl2bTFIAGmct9uukANm+ZLqPowsA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wge0I-000166-NT;
	Mon, 06 Jul 2026 07:44:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wge02-00014T-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 07:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2sLqbySZjHysKxA6BZoysTxfs61Z1Uon0anobcMBkM=; b=U5IAzLuNzXxASspFIM+8fx7qJ4
 yEJYV8h2d5T62rIgFG1wfY80TELjyCdMlKEpL+geqfUz2EYumP+iW7Vt7FTbPXJvAnWy6lawmCHb+
 qwuG+DuxVeUbLFcF0f3L9bzvwPYO+gsviypOyAl0mdDwRjHQ+z9tt8blbnfaMQaOhf7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K2sLqbySZjHysKxA6BZoysTxfs61Z1Uon0anobcMBkM=; b=aB3NichNM0uspn4kyYyY32NUQ7
 FS8IufADEnO/Hlshs26AHn8JUnqWE+5nDuak2ws+bMYY7yqGFlBrJjtuT3ofOAVtyqu6mVILJqBVd
 j1EJ8/bk1DWTKDy0aTOaQPP9C1G5c2qDhsdbm8+XSLKnNMxySJpJL6IxPqX9agj9Er9E=;
Received: from m16.mail.126.com ([220.197.31.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wge00-0005t3-PE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 07:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=K2sLqbySZjHysKxA6BZoysTxfs61Z1Uon0anobcMBkM=;
 b=IK6AjMEbbjlWa1u36v2fyYrzvf+nvwAt+NsvsjnstxowtYFHUZ6wcsiviBNEc+
 hQHvpzdc/MR0thRtYw0n08vG1qYlLlQl7Y2bjDVkZNq2ERwTqbgigNP5pWU7DSdK
 +Nw00M0VFf0NWJm5j29JHsxq4U7HLKfeemtsDRJLsVwsI=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wD3H7ClXEtqIfm7Cg--.59316S2; 
 Mon, 06 Jul 2026 15:43:34 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  6 Jul 2026 15:43:33 +0800
Message-ID: <20260706074333.2805230-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a9b257fd-68ce-45a6-b4df-be5faf583e2d@kernel.org>
References: <a9b257fd-68ce-45a6-b4df-be5faf583e2d@kernel.org>
 <20260622160830.324455-2-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3H7ClXEtqIfm7Cg--.59316S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrCrWDCryDXw4xZw1kWFy8Krg_yoWxWrX_Wr
 ykCaykG3y8JrsxJF17G3Zrt34jvan3XFy8uayxXF1IyrykG3y8Cw4jgwn09FWvqF45trZ0
 9r4DXw4rZryfWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRJKs7UUUUU==
X-Originating-IP: [114.247.175.250]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowatfWpLXKYZzgAA35
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Yes, this can happen. By design,
 prepare_large_folio_write_begin()
 skips f2fs_folio_state allocation when the write fully covers the entire
 large folio (i.e., the folio is already uptodate or len == f [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1wge00-0005t3-PE
Subject: Re: [f2fs-dev] [RFC PATCH v2 01/10] f2fs: extend folio state for
 large folio write path
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
From: Nanzhe Zhao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: baohua@kernel.org, zhaonanzhe@xiaomi.com, Ryan.Roberts@arm.com,
 jyescas@google.com, Dev.Jain@arm.com, David.Hildenbrand@arm.com,
 linux-kernel@vger.kernel.org, zhangbo56@xiaomi.com, kaleshsingh@google.com,
 jaegeuk@kernel.org, lipengfei28@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:replyto,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEF9D70DBB0

Hi Chao,

Yes, this can happen. By design, prepare_large_folio_write_begin() skips
f2fs_folio_state allocation when the write fully covers the entire large
folio (i.e., the folio is already uptodate or len == folio_size(folio)).
This is an optimization for normal buffered writes; I somehow didn't apply 
the same optimization to atomic buffered writes since they are relatively
rare.

In that case, f2fs_update_dirty_folio() may call folio_set_f2fs_reference()
on a large folio that does not yet have an ffs, so the flag is stored
directly in folio->private. 

But I agree this is a bit subtle and worth discussing.  

Thanks,
Nanzhe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
