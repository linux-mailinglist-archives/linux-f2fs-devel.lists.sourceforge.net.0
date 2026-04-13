Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFbPDpsF3WkZZAkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 17:02:51 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B113EDA8E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 17:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lnRfjd4BQDAfeluHUN1t6edhm6V5nwONqU7m3GT3Kc=; b=OTc8ThyB1jh7Cav9BBPSyIN64B
	bMTgpi4pjFLAeS1/g0Js5FSXsJouL4e0nole1H9Tc3TuN3I6DJueqc4p3j1aE0jp7NoiRXwe3SXTl
	BLTJNQfJIPoayLkvqQlsashpMn6pmZTJwJLk4itj6eXe4iQ0ugPIU0yAuEWz4awRk0Ag=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCIo8-0001lN-SB;
	Mon, 13 Apr 2026 15:02:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosen.he@oss.qualcomm.com>) id 1wCIo7-0001lE-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 15:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XGVD63DznO0I/D4Izr1tHbya4b/WSEhaxTpc23Nhjrw=; b=K1T3wPZQ8cWJsbhQSH1TOgdRRB
 RbVsP/YYjwdhH+be4JgZw3WJ4FDSsiVTwA8Rhbe98bIJbzdJiCRObpuSofKKTf9vJuD/Cj1oXSC/D
 ludAebgBH/WnIZDDDTNmqeBrPrCygxNSPp5rkIUIFt5KM3zga9hwaGYeK5bHfwQyy3QU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XGVD63DznO0I/D4Izr1tHbya4b/WSEhaxTpc23Nhjrw=; b=Zf1jaz8HmNK8/+q/i4yQjW9Jhm
 lltpEn3KtIzMzTOnGu0VF14pc5OLVF/GhI0RGFe5uHYs2a+xbhrN8rpwl7PjaNZPDrRDP36BA0asr
 g5f6Wij2R3+R1rcNbjTnZzDFoulYrNX/7Ol3XsDq0y8Drd1Ju9XeIizVHJ4M1tSt+s5Y=;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCIo6-00012v-HU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 15:02:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63DC7cuY2186212
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 13 Apr 2026 14:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XGVD63DznO0I/D4Izr1tHbya4b/WSEhaxTpc23Nhjrw=; b=QjETPfG5M4ojQrqG
 qDBRK/Dg8h7kf/mZUIoz7ywq89ICt134m8c1B5/edm9UDBxvVob7dpC+vxA+Czvu
 F0EaFCY3YvgagsfGLwM3NTyNlu6qGIauCh0VjHA2b9Ph3/4U5Hrfm/+QvFEenQqO
 6EuQKuRFkMXupwZOkX6MdLYUxFvccC6HfPBqlF6J2Y13+DbnTLELiLKfrtbeB/9N
 u6Sbc4pxELWvBR5Z8P9LB1vr8k1VDV+VBQoTtwENBtZLPoSauwLVqSjnwuRWsbBA
 kQQ1zAJzp2PEJzCSwf1AjD2HzrL2RrG7AHZqoaDHQVSrdUQHLPo7c12z4m5GNQKx
 AihS7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hgk7a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 14:42:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2b24af7ca99so63887015ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776091346; x=1776696146;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XGVD63DznO0I/D4Izr1tHbya4b/WSEhaxTpc23Nhjrw=;
 b=HlBvtM6LQW8OVe+tawBdfrShsA5D02NGpmRg+TXb1U3znvkwF1dyx9Nrhc35UjDELB
 i7eKEEGEl1dKrhAHwpgqxfEosIYkFznh7p75ZVySNSGqY0n3XY4BRS/Q/5fOlIdPxe5T
 piSeq0tujk50yql1BoqSwjX9cWDZpa7XS9AzdCSipYz4UAAFrNtLdLWIMPfaHO0sG497
 VndpXViNE+kSqEtAnxee73DfSWQLK9tAfWPBVMd8ytQHSuEkMyBmUKAJ+kzmYZDJfa3z
 k+TCsu6AkNEjt3RyipATuwvLKsJGaImZodM034zVY0MtDWKUM1RwwnOERytj+ocXQXh8
 PaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776091346; x=1776696146;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XGVD63DznO0I/D4Izr1tHbya4b/WSEhaxTpc23Nhjrw=;
 b=micC6d4X4GMhbY/pDbpkOh5z9vU8lanjir1FUF/rDaVGCp81nGUEqbsWCuZitrENCh
 mOZrbJt67CBR/e39bG7edGTJv/qUZU+5LVTckwitgnP+AcaK3TzIPlaB6wAt07JTWAbP
 8Ct25PFOIQWyrLIytgm1Qw12RwuwngXDqbsUHeo6uDQYk8YzV0vjmjnYKUJddErCjKv0
 CQT1KD5I+ql8y9KKh5zNAFThxpZTi2/9fO9NLqIYS20hZLn4Ii5MYXof72qIf+jeneTM
 Rq9VZ2mNlc7xDPZUwccI1yKEL3qjnAwGKKe5TWjRrfMD6nqqscZetWV3+ynKGCefJbcG
 elnA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/JyBoBZn3lDNg+kk+xcbYsw6gIZO37LiWmPPZPt4rlA2nR3h1TBxZIXd429b9O/Rsn83dM2YSchIrZyyQLSkj8@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyqeKTkE+ucn5PUPROa2xkBPj8+WZQc3/P3N4jOwH5WagNBCR/7
 bP+MoYW3d158doC1LJGK9WNLSRnexs0AXOMbLzvBsLMA49KZsSjj2jGFkIje85LRefSpc8fQhGi
 GHA3fB8s+J+x4Sw/mvRdkdrMiwCeHdr8733VLHmlQrClASCREZu1wp77dtHW/DfQMFW2ACLcKEN
 zj344H
X-Gm-Gg: AeBDieu8RyNZ39Y2z04mnNqnITnew6ShJwe5XbrmwbHcw918gfgD1BVVH488JxoQ2fa
 obo2e/iRQBJRhv4U0OHE7XUAGiHEy3+VKz8WRu9O0wX2wfa4w3RxAywJZl8UNwLL0pXaX4FA0CV
 sey2DhtubGs0lcJtgSi/+AJBipy0PCCLe47OM/qUcBBXp3299ghPDFIi7TGFVkB59Ivupp5EUB1
 yRTsKl4ZUJYwzW/y54hOZSoDW9hUt0Zc+OcwhrKaABC/saH1wwFWTGxSWzWiQ+5cIBpgqnO5+U0
 FqAMxiWtLl6gDixkogbRgoJXVdqR097z7WOXVwGAZIg3pj0iRTbu/LsUG8BfojCow3A3HZlPRyt
 fR63iGJwbFMM2L0AXdgahZNPvJybvWDEKpVGRGY79NhhjUQfTVJeQf+UL7x51fBG02BvUT5imIh
 EkYpZQ9wZrsOIp
X-Received: by 2002:a05:6a20:7490:b0:39f:86fc:db76 with SMTP id
 adf61e73a8af0-39fe3da68f2mr15246762637.26.1776091346116; 
 Mon, 13 Apr 2026 07:42:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7490:b0:39f:86fc:db76 with SMTP id
 adf61e73a8af0-39fe3da68f2mr15246728637.26.1776091345551; 
 Mon, 13 Apr 2026 07:42:25 -0700 (PDT)
Received: from ?IPV6:2408:840d:8f00:caf8:1d8e:e32b:e059:5521?
 ([2408:840d:8f00:caf8:1d8e:e32b:e059:5521])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f0c4b7d10sm12147388b3a.28.2026.04.13.07.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 07:42:25 -0700 (PDT)
Message-ID: <90f3c071-9567-476f-aa27-866cd5310776@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 22:42:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
 <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
 <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
Content-Language: en-US
In-Reply-To: <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
X-Proofpoint-ORIG-GUID: 7GnD6HmmL_kEkWoWpuBD4c7HWZoNkQo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE0NCBTYWx0ZWRfX5W3Kt76i9VSC
 kv+PT9nFwlUqkFqr1SR4BnKDAxjtVuzCKZET0FCFJKhFM2/+jxnJPh5FBiQlXqoDX+6u7M4mwf0
 qVU4wmvPF7L2tXeAoGjcgl2M5rUkSBE6U3rWLur7swieIbg6uYqmeN9ZXCpW8pGQLhz5Bix71g5
 TiZPURffzxaRzPhOJoF4MCLoqo9z85FvxoYaoRo7tlO0MFGkkyhCmI/y7/9HuLFPgfnGj53YEnZ
 fKLyaznsR6w/0eunSL7BOSDiUUuWlVpFda0GpBr9HjJHMBrugm7OaL57GV0QCVGO5engsVSXaVw
 pBI3SaxcbeM6zKQRbvue5w9KVz+aW5aBAzG7cSp1BXJBsFOHj8hnNx/IQpOsFvvNnf1vwQRHV6y
 xlEIzw0IET+q0HU8mSPTbwHqM0BotMl2rVbPYBx9EwiLDCERXxPqVTkmoNfzYrBBR0J0Xi0mKgm
 dbsNIMcca7scELZpXjA==
X-Proofpoint-GUID: 7GnD6HmmL_kEkWoWpuBD4c7HWZoNkQo2
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dd00d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=d9Uml3GaWomRslR1HGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130144
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/13/2026 7:54 PM, Chao Yu wrote: > On 4/10/2026 6:53
 PM, Xiaosen He wrote: >> kworker/u32:7(f2fs writeback thread) was trying to
 acquire >> sbi->writepages, the mutex was already acquired by emul [...] 
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
X-Headers-End: 1wCIo6-00012v-HU
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix deadlock in serializing io
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
From: Xiaosen via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Xiaosen <xiaosen.he@oss.qualcomm.com>
Cc: can.guo@oss.qualcomm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qualcomm.com:-,oss.qualcomm.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[xiaosen.he@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17B113EDA8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMTMvMjAyNiA3OjU0IFBNLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDQvMTAvMjAyNiA2OjUz
IFBNLCBYaWFvc2VuIEhlIHdyb3RlOgo+PiBrd29ya2VyL3UzMjo3KGYyZnMgd3JpdGViYWNrIHRo
cmVhZCkgd2FzIHRyeWluZyB0byBhY3F1aXJlCj4+IHNiaS0+d3JpdGVwYWdlcywgdGhlIG11dGV4
IHdhcyBhbHJlYWR5IGFjcXVpcmVkIGJ5IGVtdWxhdGVkOzAuCj4+IGt3b3JrZXIvdTMyOjcgdHJp
ZWQgdG8gZmx1c2ggcGx1Z2dlZCBJTyBiZWZvcmUgc2xlZXAsIGR1cmluZwo+PiBmbHVzaGluZyBw
bHVnIGxpc3QsIGt3b3JrZXIvdTMyOjcgZ290IHByZWVtcHRlZCBpbiBSQ1UgcmVhZC1zaWRlCj4+
IGNyaXRpY2FsIHNlY3Rpb24gYW5kIGdvdCBzY2hlZHVsZWQgb3V0IHdhaXRpbmcgdG8gYmUgd29r
ZW4gdXAgYnkKPj4gdGhlIHJlbGVhc2Ugb2YgbXV0ZXguIGVtdWxhdGVkOzAgd2FzIGJsb2NrZWQg
b24gYmxrX21xX2dldF90YWcKPj4gYXMgdGhlcmUgd2FzIG5vIGF2YWlsYWJsZSB0YWcgYW5kIGV4
cGVjdGVkIHRoZSBwcmV2aW91cyBJTwo+PiByZXF1ZXN0cyB0byBiZSBoYW5kbGVkIGJ5IFVGUyBo
b3N0IHRvIHJlbGVhc2UgdGFncywgYnV0IFVGUyBob3N0Cj4+IHdhcyBibG9ja2VkIG9uIHN5bmNo
cm9uaXplX3JjdSB3YWl0aW5nIGZvciBlbmRpbmcgb2YgUkNVIGdyYWNlCj4+IHBlcmlvZC4gdGhl
IGRlYWRsb2NrIHdhcyBjYXVzZWQgYnkgd3JpdGViYWNrIHRocmVhZCB3YXMgc3R1Y2sgaW4KPj4g
UkNVIGNyaXRpY2FsIHNlY3Rpb24gd2FpdGluZyBmb3IgbXV0ZXguIGNhbGwgYmxrX2ZsdXNoX3Bs
dWcoKSBpZgo+PiBtdXRleF90cnlsb2NrKCZzYmktPndyaXRlcGFnZXMpIGZhaWxlZCwgc28gdGhh
dCB0aGUgcGx1ZyBsaXN0IGlzCj4+IGVtcHR5IHdoZW4gYmxrX2ZsdXNoX3BsdWcoKSBpcyBjYWxs
ZWQgaW4gc2NoZWRfc3VibWl0X3dvcmsgdG8KPj4gZml4IHRoZSBkZWFkbG9jay4KPgo+IElNTywg
bG9vayBtb3JlIGxpa2UgYSBjb21tb24gYnVnPyBvdGhlcndpc2UsIHNvdW5kcyBsaWtlIHdlIGNh
biBub3QKPiBncmFiIG11dGV4IGxvY2sgdy8gbXV0ZXhfbG9jayBkaXJlY3RseSBkdXJpbmcgd3Jp
dGViYWNrIGluIC53cml0ZXBhZ2VzPwo+Cj4+Cj4+IMKgwqDCoMKgIFRhc2sgbmFtZToga3dvcmtl
ci91MzI6N8KgwqDCoCBbYWZmaW5pdHk6IDB4ZmZdIHBpZDrCoMKgwqAgMjMzIHRnaWQ6wqDCoMKg
IDIzMyBjcHU6IDYgcHJpbzogOTggc3RhcnQ6IDB4ZmZmZmZmODA5OTM5MDA0MAo+PiDCoMKgwqDC
oCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6IDB4MCBzdGFjayBiYXNlOiAweGZmZmZmZmMwODNj
NDgwMDAKPj4gwqDCoMKgwqAgTGFzdF9lbnF1ZXVlZF90czrCoMKgwqDCoCAzOTAuMTY5Mzk1ODc3
IExhc3Rfc2xlZXBfdHM6IDM4OS43NTY2Mzk1NzQKPj4gwqDCoMKgwqAgU3RhY2s6Cj4+IMKgwqDC
oMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+IMKgwqDCoMKgIFs8
ZmZmZmZmZDNhMGIxZGViOD5dIF9fc2NoZWR1bGUrMHhhMzAKPj4gwqDCoMKgwqAgWzxmZmZmZmZk
M2EwYjFlNzU0Pl0gcHJlZW1wdF9zY2hlZHVsZV9ub3RyYWNlKzB4NjgKPj4gwqDCoMKgwqAgWzxm
ZmZmZmZkMzlmOWRkZjM4Pl0gcmN1X2lzX3dhdGNoaW5nW2p0XSsweDVjCj4+IMKgwqDCoMKgIFs8
ZmZmZmZmZDM5Zjk5OTViOD5dIGxvY2tfYWNxdWlyZSsweDY4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZm
ZDM5ZmZlODcwYz5dIHJjdV9sb2NrX2FjcXVpcmUrMHgzNAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZmZTg3NjQ+XSBwZXJjcHVfcmVmX3B1dF9tYW55KzB4MjAKPj4gwqDCoMKgwqAgWzxmZmZmZmZk
MzlmZmUzYTY0Pl0gYmxrX21xX2Rpc3BhdGNoX2xpc3QrMHg1NzAKPj4gwqDCoMKgwqAgWzxmZmZm
ZmZkMzlmZmUzMjY0Pl0gYmxrX21xX2ZsdXNoX3BsdWdfbGlzdCsweDEzYwo+PiDCoMKgwqDCoCBb
PGZmZmZmZmQzOWZmZDQzYTg+XSBfX2Jsa19mbHVzaF9wbHVnKzB4MTFjCj4KPiBJdCB0cmllcyB0
byBmbHVzaCBwbHVnIGxpc3QgaW5zaWRlIG11dGV4X2xvY2soKSBhbmQgdGhlbiBiZSBibG9ja2Vk
LiBXaWxsIGl0IGNhdXNlCj4gdGhlIHNhbWUgaXNzdWUgdy8geW91ciBiZWxvdyBpbXBsZW1lbnRh
dGlvbjoKPgo+IGlmICghbXV0ZXhfdHJ5bG9jaygmc2JpLT53cml0ZXBhZ2VzKSkKPiDCoMKgwqDC
oGJsa19mbHVzaF9wbHVnKCgoc3RydWN0IHRhc2tfc3RydWN0ICopY3VycmVudCktPnBsdWcsIHRy
dWUpOyA8LS0tIGhlcmUKCklmIGJsa19mbHVzaF9wbHVnIGlzIGNhbGxlZCBoZXJlLCB3aGVuIHBy
ZWVtcHRpb24gaGFwcGVuZWQgaW4gUkNVIGNyaXRpY2FsCgpzZWNpdG9uLCB0aGUgdGFzayB3b3Vs
ZCBiZSBzY2hlZHVsZWQgb3V0IGluIFIgc3RhdGUsIHNvIHRoYXQgdGhlIHRhc2sgY2FuIGJlCgpz
Y2hlZHVsZWQgaW4gcXVpY2tseSB0byBlbmQgUkNVIGdyYWNlIHBlcmlvZCwgdGhlbiBpdCB3b24n
dCBibG9jayBVRlMgaG9zdC4KClJlZ2FyZHMsCgpYaWFvc2VuCgo+IC4uLgo+IG11dGV4X2xvY2so
JnNiaS0+d3JpdGVwYWdlcyk7Cj4KPiBMZXQgbWUga25vdyBpZiBJJ20gbWlzc2luZyBhbnl0aGlu
Zy4KPgo+IFRoYW5rcywKPgo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5M2U2YzQ+XSBzY2hlZF9z
dWJtaXRfd29yaysweDc4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTRkOD5dIHNjaGVkdWxl
KzB4MzgKPj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlNWM0Pl0gc2NoZWR1bGVfcHJlZW1wdF9k
aXNhYmxlZCsweDE4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIyMGM3Yz5dIF9fbXV0ZXhfbG9j
a19jb21tb24rMHhhYjgKPj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjIwMDg0Pl0gbXV0ZXhfbG9j
a19uZXN0ZWQrMHgyYwo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZWE3MmM+XSBmMmZzX3dyaXRl
X2RhdGFfcGFnZXMrMHhkNjQKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIzOTU4Pl0gZG9fd3Jp
dGVwYWdlcysweGQ0Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmQwOWZkOD5dIF9fd3JpdGViYWNr
X3NpbmdsZV9pbm9kZSsweDc4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmQwOTk1OD5dIHdyaXRl
YmFja19zYl9pbm9kZXMrMHgyYjgKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5Y2MwPl0gX193
cml0ZWJhY2tfaW5vZGVzX3diKzB4YTAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5MDU0Pl0g
d2Jfd3JpdGViYWNrKzB4MTg4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmQwNjZkMD5dIHdiX3dv
cmtmbltqdF0rMHg0MzgKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTE5OGUwPl0gcHJvY2Vzc19v
bmVfd29yaysweDI3Ywo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5MWJhZjg+XSB3b3JrZXJfdGhy
ZWFkKzB4MzU4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkyNDUzND5dIGt0aHJlYWQrMHgxNTAK
Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmODMwZTQ0Pl0gcmV0X2Zyb21fZm9yaysweDEwCj4+Cj4+
IMKgwqDCoMKgIFRhc2sgbmFtZToga3dvcmtlci91MzI6MsKgwqDCoCBbYWZmaW5pdHk6IDB4ZmZd
IHBpZDrCoMKgwqDCoCA5MCB0Z2lkOsKgwqDCoMKgIDkwIGNwdTogMSBwcmlvOiAxMjAgc3RhcnQ6
IDB4ZmZmZmZmODBhZGFlODA0MAo+PiDCoMKgwqDCoCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6
IDB4MCBzdGFjayBiYXNlOiAweGZmZmZmZmMwODBhMTgwMDAKPj4gwqDCoMKgwqAgTGFzdF9lbnF1
ZXVlZF90czrCoMKgwqDCoCAzODkuODk5NjA4NjM3IExhc3Rfc2xlZXBfdHM6IDM4OS44OTk2NjUz
MDMKPj4gwqDCoMKgwqAgU3RhY2s6Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9f
c3dpdGNoX3RvKzB4MjE0Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZGViOD5dIF9fc2NoZWR1
bGUrMHhhMzAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlNGU4Pl0gc2NoZWR1bGUrMHg0OAo+
PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGZhNjQ+XSBzeW5jaHJvbml6ZV9yY3VfZXhwZWRpdGVk
KzB4OTI4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjlkZWViMD5dIHN5bmNocm9uaXplX3JjdVtq
dF0rMHgyMzQKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmRlNWQ0Pl0gYmxrX21xX3F1aWVzY2Vf
dGFnc2V0W2p0XSsweGE4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2Q5MD5dIHVmc2hjZF9k
ZXZmcmVxX3NjYWxlKzB4OTAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwNjFjYTZjPl0gdWZzaGNk
X2RldmZyZXFfdGFyZ2V0KzB4MjA0Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDZkZTI0ND5dIGRl
dmZyZXFfc2V0X3RhcmdldCsweGI4Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDZkZTE0Yz5dIGRl
dmZyZXFfdXBkYXRlX3RhcmdldFtqdF0rMHhkOAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTA2ZGU1
ZTg+XSBkZXZmcmVxX21vbml0b3IrMHgzOAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5MTk4ZTA+
XSBwcm9jZXNzX29uZV93b3JrKzB4MjdjCj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkxYmFmOD5d
IHdvcmtlcl90aHJlYWQrMHgzNTgKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTI0NTM0Pl0ga3Ro
cmVhZCsweDE1MAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4MzBlNDQ+XSByZXRfZnJvbV9mb3Jr
KzB4MTAKPj4KPj4gwqDCoMKgwqAgVGFzayBuYW1lOiBlbXVsYXRlZDswwqDCoMKgwqDCoMKgIFth
ZmZpbml0eTogMHhmZl0gcGlkOsKgwqAgNTI0NSB0Z2lkOsKgwqAgNDkyMiBjcHU6IDYgcHJpbzog
MTIwIHN0YXJ0OiAweGZmZmZmZjg5ZTJlNjAwNDAKPj4gwqDCoMKgwqAgc3RhdGU6IDB4MltEXSBl
eGl0X3N0YXRlOiAweDAgc3RhY2sgYmFzZTogMHhmZmZmZmZjMGQ0MmY4MDAwCj4+IMKgwqDCoMKg
IExhc3RfZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2OTM5NTg3NyBMYXN0X3NsZWVwX3RzOiAz
OTAuMTc4NDU5NzMxCj4+IMKgwqDCoMKgIFN0YWNrOgo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBi
MWQyNTQ+XSBfX3N3aXRjaF90bysweDIxNAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWRlYjg+
XSBfX3NjaGVkdWxlKzB4YTMwCj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTRlOD5dIHNjaGVk
dWxlKzB4NDgKPj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlOGY0Pl0gaW9fc2NoZWR1bGUrMHgz
OAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZWIxMTA+XSBibGtfbXFfZ2V0X3RhZysweDFhNAo+
PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZGVkYzg+XSBfX2Jsa19tcV9hbGxvY19yZXF1ZXN0cysw
eDM1OAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTQwOWM+XSBibGtfbXFfc3VibWl0X2Jpbysw
eDUwYwo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZDRjYjg+XSBfX3N1Ym1pdF9iaW9banRdKzB4
MTY0Cj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZkMmU3Yz5dIHN1Ym1pdF9iaW9fbm9hY2N0X25v
Y2hlY2srMHgxNGMKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmQzMzk0Pl0gc3VibWl0X2Jpb19u
b2FjY3QrMHgzMzAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmQzODE0Pl0gc3VibWl0X2Jpbysw
eDFmNAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTJiYTg+XSBmMmZzX3N1Ym1pdF93cml0ZV9i
aW8rMHg4OAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTQxM2M+XSBfX3N1Ym1pdF9tZXJnZWRf
YmlvW2p0XSsweGJjCj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlM2M0Yz5dIGYyZnNfc3VibWl0
X3BhZ2Vfd3JpdGUrMHg0MDAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZjA0YWFjPl0gZG9fd3Jp
dGVfcGFnZSsweDE4MAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmMDRjYTA+XSBmMmZzX291dHBs
YWNlX3dyaXRlX2RhdGErMHg3OAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTg4ZDQ+XSBmMmZz
X2RvX3dyaXRlX2RhdGFfcGFnZSsweDM5MAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZThkZjA+
XSBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHgxZTAKPj4gwqDCoMKgwqAgWzxmZmZmZmZk
MzlmZWVhMjg4Pl0gZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4OGMwCj4+IMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZmJiMzk1OD5dIGRvX3dyaXRlcGFnZXMrMHhkNAo+PiDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZiYTE1M2M+XSBfX2ZpbGVtYXBfZmRhdGF3cml0ZV9yYW5nZSsweDk0Cj4+IMKgwqDCoMKgIFs8
ZmZmZmZmZDM5ZmJiMDM3MD5dIGdlbmVyaWNfZmFkdmlzZSsweDFkOAo+PiDCoMKgwqDCoCBbPGZm
ZmZmZmQzOWZlYWJhYTA+XSBmMmZzX2ZpbGVfZmFkdmlzZSsweDEyNAo+PiDCoMKgwqDCoCBbPGZm
ZmZmZmQzOWZiYjA1NzA+XSBfX2FybTY0X3N5c19mYWR2aXNlNjRfNjQrMHg3MAo+PiDCoMKgwqDC
oCBbPGZmZmZmZmQzOWY4NDdlN2M+XSBpbnZva2Vfc3lzY2FsbCsweDU4Cj4+IMKgwqDCoMKgIFs8
ZmZmZmZmZDM5Zjg0N2RhND5dIGVsMF9zdmNfY29tbW9uW2p0XSsweGI4Cj4+IMKgwqDCoMKgIFs8
ZmZmZmZmZDM5Zjg0N2QxOD5dIGRvX2VsMF9zdmMrMHgxYwo+PiDCoMKgwqDCoCBbPGZmZmZmZmQz
YTBiMTRmYWM+XSBlbDBfc3ZjKzB4NDAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjE0ZWY4Pl0g
ZWwwdF82NF9zeW5jX2hhbmRsZXJbanRdKzB4ZDAKPj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmODEx
NmEwPl0gcmV0X3RvX3VzZXJbanRdKzB4MAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvc2VuIEhl
IDx4aWFvc2VuLmhlQG9zcy5xdWFsY29tbS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2RhdGEu
YyB8IDYgKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5kZXggMzM4
ZGY3YTJhZWE2Li5jOGU4MWY2M2ZlNzMgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+
ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0zNTg1LDcgKzM1ODUsMTMgQEAgc3RhdGljIGlu
dCBfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywK
Pj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKF9fc2hvdWxkX3NlcmlhbGl6ZV9p
byhpbm9kZSwgd2JjKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFtdXRleF90cnlsb2NrKCZz
YmktPndyaXRlcGFnZXMpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibGtfZmx1c2hfcGx1
ZygoKHN0cnVjdCB0YXNrX3N0cnVjdCAqKWN1cnJlbnQpLT5wbHVnLCB0cnVlKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfbG9ja2Vk
Owo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZzYmktPndyaXRlcGFnZXMp
Owo+PiArc2V0X2xvY2tlZDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGxvY2tlZCA9IHRydWU7Cj4+
IMKgwqDCoMKgwqAgfQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
