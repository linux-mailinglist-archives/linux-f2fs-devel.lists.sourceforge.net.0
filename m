Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP8uAO+Jn2mmcgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:46:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8719F0B8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 00:46:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrjDZfw+xDe90wspjhS11jViN1LqS5gMHLBmYarLUck=; b=VkstBv+brFusUq3YePeAyhxn2s
	4UYEPy2zSfqxPdsEHe2onXInD27TSmUTqymViMGYQ2dQecW+AjNDqvFxNvrNB8JEDFv1LKcpFCH6O
	oila9k9jhZ0RaLBIT0c1Ve2mh+B9H3d7MLrd0ecmeqwnNFpIaAwgvhRX6UkJYEiTSTFQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvOag-00074O-E3;
	Wed, 25 Feb 2026 23:46:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tz2294@columbia.edu>) id 1vvOae-00074H-MX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=alpDw3ItzbUTKzx46DBJhWkupeO49VjqF0Ov6EtA2u8=; b=UoRMCafop0PgDuRLYzvsLOBfNH
 3P9CNOyJH+6b6nkEIbRL7CsHNRgsYl7HuG5KJeSe1pcNkaK7U/QtFGRVOnGMKQTctUoEFOSxdaeZQ
 xmKp6HRLLQKX+Z1JVgUW/cgkh/+3+pDDKhslVD5l3FHz1nL4/XE7Jcf2Q2iNhi4ynJCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=alpDw3ItzbUTKzx46DBJhWkupeO49VjqF0Ov6EtA2u8=; b=TG42A6RkG8Jirk32ODAhxwcjFl
 xfk5Jups44Opr7Pusx8wmqO+UdPDKkWOXRmu8XNnCcPxthpgPt2dAdvIjscIRCDZnlA+dh1CEFIQ/
 hXyymenSvAdM376udqoQkj+uogQ2BSm3NJv/RuVNvXtZ/YXAMji35w6vC86y3xlcqnCQ=;
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvOae-0001EQ-16 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 23:46:48 +0000
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PNNLLn4067870
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 25 Feb 2026 18:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=alpD
 w3ItzbUTKzx46DBJhWkupeO49VjqF0Ov6EtA2u8=; b=IqQmO8iyq4x1wZil7iSE
 Yb5VlrEZoCcHhGcsRlLoFrYHNcJWSFZXP8Lkch4N9gYsiVWmO8YAMgNCZ+jSPuGh
 hbzp9auArHHb5yygWb5QfvydQTFv+DYtmGbLjW8Nwh0rL1RrfdpC0iT59uqajbTP
 pU7EnC4qWLZrOpedU07ruJkUXMkIs22OpRsb3adN3lN+kWmX4Sku7pQRCDKjiGjP
 JUl39ZSWtethLLBGCbiLW0+lMXwGHzzCI+8mSIkLlYsRX9eNXjchFAOFbKrlu50e
 7CYd1xHbmUbYhJax6TCWKrVbXoPJlMGSuuNsvHzEHqnIaoyug93cm8/Lmf+gekgA
 Dg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4chsqwy07j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 18:46:37 -0500 (EST)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-798656130b0so4108387b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 15:46:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772063197; cv=none;
 d=google.com; s=arc-20240605;
 b=VwtLpM/K0C7JVOv45SaHiUZqmBGEz2zS49GAK5vfbyXsHaKFRGUjvDFPuO+VVR73v2
 2258cFYEwNVibku8oLFlNw8opsGeCYLEMkB52MoIW150wrMIzagB/A/oEUg+XYZl/HkR
 gTSEsidbfqUSn4SJ94IeVvDqr/0gux3iYBt6EJ8ODmThVJYLAiGEtY5Uk1NrhJ0/L0Qt
 dfFmrPzs5YUD5MDB3Rnd1T4//EYEXR1Sbg6u8RkfvOYt6eTIlSRKUaNs3zEbctXhviue
 3Q6dxnZhJKUMRUovR/jTuZrY6fcPxGPaW5VrpTzaQysmZUK0npoVBbhh6VdYIDPeZOMm
 FCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=alpDw3ItzbUTKzx46DBJhWkupeO49VjqF0Ov6EtA2u8=;
 fh=DXXl80GbewX8jRfkiOi4l5q0ZVplPg9mksesHpFOZg4=;
 b=SEu2SWFZ8smugvQprYx5pGIL8aYwhgHOYCN/1EI6ogVFVQM11PzCGJJg4LgttLImME
 XjXUIvZeRpfjFbWKtPlftLBo9WvkVF3Xm+ZI7w9mtZihkBQyc+QvQuqN6QilV6r755KH
 y3NpoTMbUCpwXOy4YGOUcFGQf5FsNbp9jkeIzQh0eqsRTw35kGyfJx80CJ5TqlCEoHUT
 SRZsQx3aW5/R4GzbRANv5KJaJw6jfdZqp3jj/f3TP7xRF549DlzF4ZPLQE1eACp9gusj
 utfzSPaZXH0aoDetKT1pJ7U470dEDSmrAMWhJGkZz5yeG9ZRLj85tiekuKTBZzzI5L+T
 RN3w==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772063197; x=1772667997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=alpDw3ItzbUTKzx46DBJhWkupeO49VjqF0Ov6EtA2u8=;
 b=vgEQ4ejLiXY8bNnzbMIYP0a9HneF42qmrDb9jrBQhBetv+sppQ4jSesTcdcafvimcj
 C0coLq1ecLwZISVFph3geLqN1DzbDQhClwGS9BrpVF1xDrWEL9WmI33AHPLF40lPNZ/G
 O0yMAgb9WQiWIYRNVOFtm8dcrfndUiptXuk4vAiQ+UsexK680JqvI1QBwDCpboEVBxf9
 ll4aE6f7OrvNF3TmzyUC042TPmnmoVX14goA9uLNicEUCeOG/F+X/3Mgd2RZCuJ2Mk1Q
 Wrq2uJlpd081AySdwk/zUU2j7YU5J0tAFfIMCFhE2ccS0Bpkw2qooAIQl1yIQx6A2ues
 uRdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5wZCqlf4Qu9gaQFJ6leLu8Lc5Eieii9MoaR2Si0LJbJpLonm2y4R+BpfpW97KpuplTGumVNUiYVs4/smxFzC4@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywuik+FwqayV9wFuIr6BMV6bBsgmNV6G2rmLByQhrxM7JmGlf6N
 OYO0BKZNaDZH7lgtxhvqFFwuDGhHTSft7n+Fqj3KU/0ZQ6htW8Y3EHLtD8gSOrHtQVk1nb8o1+h
 y0vgfU3j4NnJmoML4hj9yi6L1Sc/m1GaBu72xPOnjgAiB3cKKsgs+2wN0r5BOC3S3iFnMJKULr+
 ABctdeY56cKyVZC3yHEKYNTsZpfyZJq52gXKWz0hlgCNQInLcORQ==
X-Gm-Gg: ATEYQzwiKnS3AZ1XiayeNIiMsPMOKfDVEDWdtjE5QtnQmRmbAqp+c47Z5o1WXZxCddQ
 oeJj7melHcC7T4qMl5Y02Y2td8cJZy1zMSF29s9ZB2a8M7fzzIzQrW2avFb2lQM2BXuJJGI386b
 zzy3BQK5RYrGvwb4U48j6Vqyy0gBubmYOzmYvoHOFL/NfosqEE6ApkT7+7pDpEj7tvGKCtzc25f
 EFOljhX
X-Received: by 2002:a05:690c:46c3:b0:798:6f20:1c87 with SMTP id
 00721157ae682-7986ffc3c55mr19756647b3.58.1772063196832; 
 Wed, 25 Feb 2026 15:46:36 -0800 (PST)
X-Received: by 2002:a05:690c:46c3:b0:798:6f20:1c87 with SMTP id
 00721157ae682-7986ffc3c55mr19756517b3.58.1772063196458; Wed, 25 Feb 2026
 15:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu>
 <aZ9f5_pgnr_62gCL@casper.infradead.org>
In-Reply-To: <aZ9f5_pgnr_62gCL@casper.infradead.org>
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 18:46:25 -0500
X-Gm-Features: AaiRm52dQnciImWHmEJDWZpvU8pRpkz10CR6JsDtukkF0Y3eoXH3DgTrzZnl7YE
Message-ID: <CAKha_sr7W3dRSnfqmruFxvoAr8aQGrAgStxjLdchfn-d8cHt2Q@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Proofpoint-GUID: HhQz-1op7H285e9mRiUJKUcMSsgsrEkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyNyBTYWx0ZWRfX76d+Nj3G8ID2
 QFLsYuRUvba1L13z8h4a6RLHIQ9ARav8CXUSVSGd4Iz0m6uOLYysCmq2xGM9TRgl967iN9tj1Mx
 RHAQyfEf/YNmALh9mmcDo2K7Ock0wZr20zYWtINUkzAK5y9yXoR98uoRzUOvFTbNmAz1hbfqVgJ
 oECljWYub2rXCQHTt3/rAMAL2jw+rEL6Xp8E0b3D9olgkuuhzKMrGpb50HQ4XifskwQrt7s5mL9
 TOuF36x30hnzLYsNhzZRHux0SfZoWMUFu2TCMVrBvg+VmF0ga2yAkqv3FYBZaLsovjzBswaR1g+
 jc+l75Rf+ldryBFwjZZyrR6HtIABXqFhw0DvHyZOwMICJ8YxT/p4ZYDwEuHmeUyaW95X0/7kdy6
 EFqy09FtgkK404OHcAWzU64gDNwTfHLR1Uqs7yTK6GVMYh720DPyXBmopP3TAKPmPNEqCjIWw3h
 sZY+qMim1VroWbb3c4w==
X-Authority-Analysis: v=2.4 cv=Y8b1cxeN c=1 sm=1 tr=0 ts=699f89dd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=x7bEGLp0ZPQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=Qm0qsxP7aFY2tkT6R2MF:22 a=JfrnYn6hAAAA:8 a=vsynCidFeb6Hwkx_kP0A:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: HhQz-1op7H285e9mRiUJKUcMSsgsrEkl
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 priorityscore=1501 bulkscore=10 adultscore=0
 lowpriorityscore=10 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250227
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 25,
 2026 at 3:47 PM Matthew Wilcox <willy@infradead.org>
 wrote: > On Wed, Feb 25, 2026 at 12:57:16PM -0500, Tal Zussman wrote: > >
 struct pagevec was removed in commit 1e0877d58b1e ("mm: r [...] 
 Content analysis details:   (2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1vvOae-0001EQ-16
Subject: Re: [f2fs-dev] [PATCH] mm: Remove stray references to struct pagevec
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
Cc: linux-mm@kvack.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[columbia.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:linux-mm@kvack.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-afs@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,columbia.edu:s=pps01];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,columbia.edu:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tz2294@columbia.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,columbia.edu:email,mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 47B8719F0B8
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMzo0N+KAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCAxMjo1NzoxNlBN
IC0wNTAwLCBUYWwgWnVzc21hbiB3cm90ZToKPiA+IHN0cnVjdCBwYWdldmVjIHdhcyByZW1vdmVk
IGluIGNvbW1pdCAxZTA4NzdkNThiMWUgKCJtbTogcmVtb3ZlIHN0cnVjdAo+ID4gcGFnZXZlYyIp
LiBSZW1vdmUgcmVtYWluaW5nIGZvcndhcmQgZGVjbGFyYXRpb25zIGFuZCBjaGFuZ2UKPiA+IF9f
Zm9saW9fYmF0Y2hfcmVsZWFzZSgpJ3MgZGVjbGFyYXRpb24gdG8gbWF0Y2ggaXRzIGRlZmluaXRp
b24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFsIFp1c3NtYW4gPHR6MjI5NEBjb2x1bWJpYS5l
ZHU+Cj4KPiBSZXZpZXdlZC1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJh
ZGVhZC5vcmc+Cj4KPiA+IC0tLQo+ID4gSGFwcHkgdG8gcmVuYW1lIFBBR0VWRUNfU0laRSBhbmQg
cGFnZXZlYy5oIGlmIGRlc2lyZWQgdG9vLCBidXQgdGhhdCdkIGJlCj4gPiB+NjUgbW9yZSBsaW5l
cyBvZiBjaHVybi4uLiBBbHRob3VnaCBpdCBsb29rcyBsaWtlIHRoZXJlIGFyZSBwbGVudHkgb2Yg
LmMKPiA+IGZpbGVzIHRoYXQgaW5jbHVkZSBpdCBmb3Igbm8gcmVhc29uLCBzbyBjb3VsZCBiZSBh
IGdvb2Qgb3Bwb3J0dW5pdHkgdG8KPiA+IHJlbW92ZSB0aG9zZS4KPgo+IFllcywgdGhlcmUncyBs
b3RzIG9mIGNsZWFudXAgd29yayBoZXJlIHRoYXQgSSBkaWRuJ3QgZ2V0IGFyb3VuZCB0byEKPiBU
aGFua3MgZm9yIHRha2luZyBvbiB0aGlzIG11Y2gsIGFuZCBhbnkgbW9yZSB3b3JrIHlvdSB3YW50
IHRvIGRvIGluIHRoaXMKPiBhcmVhIHdpbGwgYmUgbG92ZWx5LgoKVGhhbmtzISBKdXN0IHNlbnQg
YSB2MiB3aXRoIDMgbW9yZSBjbGVhbnVwIHBhdGNoZXMuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
