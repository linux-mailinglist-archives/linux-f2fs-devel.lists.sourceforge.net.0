Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJwxA7AVc2l3sAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 07:31:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C87100B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 07:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rq1sezLNO2X2eqT/kpyM/kn47S4rGQ10RYcY8SHF7BI=; b=VwQI95yQSx/ILyozr0Oa/VFAkQ
	e1E21CDle4S0RoEmOA/BHE1J+MfehmO68MnRlHpaG/My3wM07U12lybKjmBx9Uteis3YTorzFEVVY
	cl3ryyJZ/AsKlw/Jx0ur+dp6x3e4XCawWIpwJy/M1aeHQIPY7dBZ559sGlSgaqL5vS2Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjAh4-0004Mm-C7;
	Fri, 23 Jan 2026 06:30:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vjAh3-0004Mc-Kk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 06:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0AUgm60OdLFgZKhC/GX3rR3b1y9H+0o5ZFYifDgKPk=; b=JKch6AKE6nMOUZ7V6MaQwTvOYc
 ryA+lykuV5EfHkCLlm1acnp24mIBPp0EUJ/mbzSEgoGYCu1vYj7ENajUMdKF60JCbQD9c/Vi1ImJM
 N+taQNd7IYELlglP7N9dbDd0laXpCt0BT1OTEZ6j3Nzl6sGd7XR5qOb03mcw2CKsRv8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X0AUgm60OdLFgZKhC/GX3rR3b1y9H+0o5ZFYifDgKPk=; b=HTlvNAGG1Mev0+9WjFUN0f3dON
 SSjIzklEqiLsVXSkO1z6OJ24s+P9cS7gZ1zZ/2PNO+L+7ubPghz/JbHiKechMp8JI/hl/UBNkdX67
 el4v7y7xxlDx2jKPz9icN4+XMlJdJuB97EgU2mEjJMC2lW38bScK02rzIy0J0WWqdpIM=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjAh3-0000cB-Iw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 06:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=X0AUgm60OdLFgZKhC/GX3rR3b1y9H+0o5ZFYifDgKPk=; b=o
 NIksTyKYGJcUqWMfCXrQL+Cf0VW0dSlCwRxmfok3oVL1g65ahl+ym/g/uWTDPzir
 iSQ+0TXgpd4qDBXpEIbjBrF/Zq9E9J/z5d04NZ2Ac+rkgex9PxElb9JD2X08TxLM
 /SKxlIhiQbii/x80fsFvxItuxoMdAtqfh3ikUz9aGc=
Received: from nzzhao$126.com ( [212.135.214.5] ) by
 ajax-webmail-wmsvr-41-118 (Coremail) ; Fri, 23 Jan 2026 14:30:30 +0800
 (CST)
X-Originating-IP: [212.135.214.5]
Date: Fri, 23 Jan 2026 14:30:30 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Jaegeuk Kim" <jaegeuk@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <aXKuTRfZXE4z0j1_@google.com>
References: <20260109024716.12047-1-chao@kernel.org>
 <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
 <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
 <CAGsJ_4weE5T1uBA1-JoJdbZY4E91eN_OL3hMdqixLcoKSrmuzw@mail.gmail.com>
 <8c13ca69-a08a-41c7-bbef-0a79a5f44f93@kernel.org>
 <83419982-77ba-4dac-880e-bf59669a006f@126.com>
 <aXKuTRfZXE4z0j1_@google.com>
X-NTES-SC: AL_Qu2dC/2ftkAo5iKZZukfmUgRgOw3XMSyu/oi2o9UO5FwjA/j6BI5XVxgElrb3umJJgCyoRW1cSZu+N1KY6J3eYcJMZRdQ6Y9ywNtus59zSd20A==
MIME-Version: 1.0
Message-ID: <43f34976.480b.19be98c144d.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dikvCgDHf72GFXNpar1KAA--.13341W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsAadbWlzFYYLFQAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Kim: At 2026-01-23 07:10:05, "Jaegeuk Kim" wrote: > >Yes, 
 I was hitting some issues when I convert the mapping while inode is alive.
 >So, for now,
 we should set it in f2fs_iget() only. > What about using mapping_set_xxx
 functions in f2fs_new_inode then? It maybe be a bit odd to me that we create
 a immutable file but we can only get large folios for this inode when the
 inode is evicted [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [220.197.31.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vjAh3-0000cB-Iw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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
Cc: Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[126.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:21cnbao@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	MSBL_EBL_FAIL(0.00)[linux-f2fs-devel@lists.sourceforge.net:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FREEMAIL_FROM(0.00)[126.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EB0C87100B
X-Rspamd-Action: no action

Hi Kim:
At 2026-01-23 07:10:05, "Jaegeuk Kim" <jaegeuk@kernel.org> wrote:

>
>Yes, I was hitting some issues when I convert the mapping while inode is alive.
>So, for now, we should set it in f2fs_iget() only.
>

What about using mapping_set_xxx functions in f2fs_new_inode  then?
It maybe be a bit odd to me that we create a immutable file but we can
only get large folios for this inode  when the inode is evicted and get
by f2fs_iget again, not get large folios by the first place.

Thanks,
Nanzhe Zhao
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
