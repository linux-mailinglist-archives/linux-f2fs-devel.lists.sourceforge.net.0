Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mx3BNSyjUGri2gIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 09:45:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549873821F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 09:45:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=k8tmB7hE;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Eadsxba3;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Ti/n6a93";
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=nnn1ZKmx;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KamgOu087a6saqfDLw7DOy2YxeaxC+uk1iHK6GtO/j4=; b=k8tmB7hEnWqLUvtduwaupkld0W
	fjKcxR8XzoyHMQNgJf8gm+5HJZRNJf3b+b8PZM9qVLX4+OK227aCgOD7o4lBMBEjgkXPts/2hrfOk
	ssViktVFH8aFuz4dbQmBDJNArhqXDxN/vVudZFWoRpPXujDDveaupbbI+jkRnACsUZrI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wi5vR-0008Td-HN;
	Fri, 10 Jul 2026 07:45:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wi5vP-0008TV-3m
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 07:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lAtidVHt3txYd7QiAwxP1Zg6VS9bpT5GNQz5miA0BfM=; b=Eadsxba3ZqzyDBGqkMGzqoZawi
 g2s0hDLOjam+zOOlPbm8mnVQSr62MMweCLs8hrlSa71zw1bMg0Ihd5GfexwU56zg1RSsUN3U49eUP
 OQG4l1eyZBuJOhXu8j/H2aHEj53QN/YtLwQZW03ueL16WqFwx4N1Hkrve1Lkhvp3mOM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lAtidVHt3txYd7QiAwxP1Zg6VS9bpT5GNQz5miA0BfM=; b=Ti/n6a93VPSfLLXODvcbnckQnA
 vLPDIQQvrYOXaS9jEOsLaH2g8AJfQlyxis5G8Lfadpinq0ByUTaNg+63SoI5wwlGLuo1Em6jkRo18
 I/WaH3YhKLJ3F2+OnwaIwWWH3kI3Hzl7v0YhZvt8OCwGCmQWgpzILXXPFd4lJm2GZw00=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wi5vO-0008Oi-Hj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 07:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lA
 tidVHt3txYd7QiAwxP1Zg6VS9bpT5GNQz5miA0BfM=; b=nnn1ZKmxiMi0s1QW0z
 w4QGoZEndFEoOIgRIsFU7GAUEpKQX/Oksg74atfYdBQLzHcM7eZUwmOdFme0vEZC
 vdSXrIrscqR2pXAZUNnNl0+B6/p31e7lbI0ZWF1tzSMHKBSQTiAaMZwEHrzAnFu3
 zLsxjJz8hHgQOutDTVGwP7lBs=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PikvCgD3f4_3olBq0cHyCg--.58119S2;
 Fri, 10 Jul 2026 15:44:56 +0800 (CST)
To: Chao Yu <chao@kernel.org>
Date: Fri, 10 Jul 2026 15:44:55 +0800
Message-ID: <20260710074455.704198-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f1ad5d3d-f4c5-498f-8378-a5efff74a458@kernel.org>
References: <64ce7a28-992d-4d20-bbb1-b76943911ab4@kernel.org>
 <20260710011534.2307696-3-zhaonanzhe@xiaomi.com>
 <f1ad5d3d-f4c5-498f-8378-a5efff74a458@kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: PikvCgD3f4_3olBq0cHyCg--.58119S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4fGF13uryfuw1fAw17GFg_yoWkXrc_uF
 nI9w1vya4xW395CFZ3Ga4rXrWFgFW8KryUC3y8Xay3K345tFZ5Zr4kWr98Jr1kXw1avr9x
 Gr1vvw40vF42gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUU73PUUUUU==
X-Originating-IP: [114.247.175.250]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoxiVZWpQovhBYwAA3J
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > > Both the error path and the normal path will eventually
 reach the out label path, > > and out will call f2fs_put_dnode(&dn) if get_dn
 is true. > > Or am I missing something? > > For above case: bo [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.7 listed in wl.mailspike.net]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wi5vO-0008Oi-Hj
Subject: Re: [f2fs-dev] [RFC PATCH 3/9] f2fs: support regular file buffered
 writes on large folios
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
Cc: Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, David Hildenbrand <David.Hildenbrand@arm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Pengfei Li <lipengfei28@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:baohua@kernel.org,m:jyescas@google.com,m:Dev.Jain@arm.com,m:David.Hildenbrand@arm.com,m:linux-f2fs-devel@lists.sourceforge.net,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:Ryan.Roberts@arm.com,m:jaegeuk@kernel.org,m:lipengfei28@xiaomi.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:replyto,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5549873821F

> > Both the error path and the normal path will eventually reach the out label path,
> > and out will call f2fs_put_dnode(&dn) if get_dn is true.
> > Or am I missing something?
>
> For above case: both head and tail has partial updated data, then we call
> f2fs_get_dnode_of_data() twice, but call f2fs_put_dnode() once?

I think f2fs_put_dnode() will be called twice in that case.

The out label is still inside the while loop body. For each block returned by
f2fs_find_next_need_read_block(), get_dn is reset to false first. If
f2fs_get_dnode_of_data() succeeds, get_dn is set to true, and the same
iteration will fall through/goto out and call f2fs_put_dnode(&dn).

So for head and tail, the flow should be:

head: get dnode -> read/zero -> out -> put dnode
tail: get dnode -> read/zero -> out -> put dnode

If head and tail are the same block, the first iteration marks it uptodate,
so the next f2fs_find_next_need_read_block() will not return it again.

Hmmm, if the current control flow is so easy to misread, would you like me
to change it a bit to make the per-iteration dnode lifetime more obvious?

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
