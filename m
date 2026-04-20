Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DlnFxcl5ml1sgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 15:07:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90442B3C9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 15:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocAdE3mo7i3rZNK8KIydLmUao98m0NBQZo/sQpj7MzE=; b=XxjeG7HiILKD7GpZE+eQ9oLnI+
	D/Pkma5DaAdU7sx24ZanxJezvtFWuYLeVLeRm00VEv0hj/FZcCg6TuWxwmnLhNaSbdPmFOI62J1Q2
	dcSYtuvJRF89YV2UhbkErIhgfrrocCrueS8MwEYa9LF/e2oQ3ISWcYb2x3IGmQRhPeOo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wEoLO-0001NS-7K;
	Mon, 20 Apr 2026 13:07:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosen.he@oss.qualcomm.com>) id 1wEoL5-0001MN-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 13:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DILbnPYAZ7IpK3GRCi9yOwb59X0OYDwmaHxdm88xKOI=; b=daxGLLH01e90K93M/GD/FO/ixW
 fl8qVpV9NINCjgC9Su4sJadhutDIb9GKhmB66jcSTaaj+DkkSIHKSNq0TAwfwwdHGh3xCDsRp0T6u
 nkBeWlnTW3/LwjAVbgqvLiPAyRHTqP4TI/RxgEnq5isRmZKdkJycAhjd2HC2+TeMwPMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DILbnPYAZ7IpK3GRCi9yOwb59X0OYDwmaHxdm88xKOI=; b=CygW0sYjWA/97UcjE3xL3qMx9i
 7oNEb8OE9BzAZ1+T0nm8sfpx/N7JXYYWkH2WZNfIdOQmcJ5Rl6dH1YUgUNtLylPxLxBB96etqbZOU
 k6UpApyKluBtk5bjKhiMEVJSM0Pbwjd7S6iYcoMycImY39NPBkhB8byup2NCfYZx+KyQ=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEoL4-0003MT-Be for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 13:06:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63K91SOG2281708
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 20 Apr 2026 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DILbnPYAZ7IpK3GRCi9yOwb59X0OYDwmaHxdm88xKOI=; b=H5m0hMS0srSCSFKn
 lwpoZjiY4UY8mA12nroJ5YM8PsgKRwr7np0uXZa/e/aVLx1uOSVwIV087WX93WUv
 wco9whrVk/1FE4LyMWBTeGirMw1UczMhs4ptgSk/xbKN6yggp/A9dvbuk0UGbchp
 OH0zoXxAgdp26ib41nV8KyUX4FW3o2Sbspcchkj+HcP8yAJ95iWnJlj3PchSKHU/
 JAwL9t7r8jeZo1q3jgSKS8zUmu1hjDPALerA97Q/1b2g5l1wMiBkJawcyl1w9So6
 6ulFW81FAD5MW6to5NFPdVWN3ZV4mTRrIs/sUfj0DZ72+/DsJhuCzgZjTdryO1Kg
 4MLLzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598txr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Apr 2026 13:06:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-82f803658d5so3523508b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Apr 2026 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776690406; x=1777295206;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DILbnPYAZ7IpK3GRCi9yOwb59X0OYDwmaHxdm88xKOI=;
 b=byhHNCXPgSN5WM4fsYDYRKVTcrbaPVR9Yj2GMmI3fOuJo9gumUpc3elN1byKUIle1E
 yZiS0VhmAil/pCuQqP1adcsEHYxytS+sF5koZvhp6qfNotuPRi4SHCGo9Jc/OAcCpfyS
 iWNpQz1CBgMKr2WT76NejvCGztnQDaOy4LqxINrtltbr0eAIv0SeEMgzrNsrPioMAM1M
 2bhvZbXPGzsqbodqebyrJfmo/sevcsm5Z3aohVvQb78MrLRK/1AP6V8exduUqA1SZNmg
 Xna84wsnML9yzbuRW+H62etTY7rlhqdOt618v45oe3qNS3x6owmn8jG6GkDUvfooXzKM
 OO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776690406; x=1777295206;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DILbnPYAZ7IpK3GRCi9yOwb59X0OYDwmaHxdm88xKOI=;
 b=tH+SYWJjKQNT22iyfIieEVNvn+B6Ic4OivPOwzUVMvrnEDW/yp7dD+IhzHx3cSbuHZ
 9sjBEYCZjHGlFMvE25IseAPQ16ngRBlWXKFUxAlvQU1noywIxJiHZqlWixKEmf0R4FVN
 DcFRzGv+VZIMhbz+MG91xQjUv8rliuyMTVES9I/KpeAO9/vErLjBfDq7mHNuEoDgZkIr
 LRGeTST5YU2+WLXJR+Z3XIVPTvQWx7uX4kwS7cgrGLvb26bU7UF3DO3IDWcUddqgt157
 FhI13xFTgdxQqZoq1GqCKaDl93tNRtyg+OJwp7GAttq57JPmNAIdOpGO+YoYihUTBx1H
 6onA==
X-Forwarded-Encrypted: i=1;
 AFNElJ86PpEISX0HHH5d5CmZVPyeAXWnDRYgzfA3mQlcxdBj+BOFdYTAfTpE/GzXJadGkVTtj2vFZ4G5U1HjZmF7D/Oo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwyVn/z18n4Du2DBR7P3vKDS5oFbuzuBNATC9jxc73ymcMwl3wg
 Y+40YwD8qNlxo99zZzWXe8xRAzKGkjBvIaYiqmlPUhznx+v7aIhPgWQXwfBbAGjEap4A1Y2iWul
 d76xcu2G+LMHZkeLLpLziFOrKTnqsIWHkm4APcBRJAVnKdSzgjnvCeG3XdiHVUJmDAbUvKGqp5C
 MkjCIh
X-Gm-Gg: AeBDietuwqzdAE7sbljIqCrzJPynL9w98s5uIkFj4O9fOsWA2NbpwA9v6ZoHt1cNn2p
 PSUvbIgYdG/SN8MNgnNxQZYGGFkcNQPonkVBhYsC0UJIehti8jAgJcJmeq9rQIUqIWer/Cuzlan
 en5WHHORNspTmxZ6PwZUh+oVrq+QEViKSWQCi2ROLMSyJ4GA1EfXjukWRiUqhm5tnjKOt7OdNLc
 gb5dmuwBlpc5fs86JmOjOKYTvfiT9EfprjDwufnssMrsJqTaN9qTBpNe4ieZjlPYtM1oQKUJC2c
 puyapp6nkJ2qg3Qi/CK6083o626Akkm54C0RRqqjNQpa/3jIc1SXf5cv+Dci9SzblV0Uh5N+lWx
 tCYENEt1kapvyD23+bksAlcyJayA8l7108g8Fd2NWgJsv0Xu/b59KsheCLe/QOk8yEjqO/7Unhe
 P3yeD3LcSs/emrav7teOGzZC0N
X-Received: by 2002:a05:6a00:3cc7:b0:82f:5051:f024 with SMTP id
 d2e1a72fcca58-82f8c8ca07fmr15006734b3a.27.1776690405918; 
 Mon, 20 Apr 2026 06:06:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cc7:b0:82f:5051:f024 with SMTP id
 d2e1a72fcca58-82f8c8ca07fmr15006679b3a.27.1776690405174; 
 Mon, 20 Apr 2026 06:06:45 -0700 (PDT)
Received: from [10.249.29.31] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e982fd3sm13676448b3a.10.2026.04.20.06.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 06:06:44 -0700 (PDT)
Message-ID: <c91ba4f4-99ba-4ee4-be21-3b678e8b0093@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:06:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
 <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
 <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
 <90f3c071-9567-476f-aa27-866cd5310776@oss.qualcomm.com>
 <765aa6b4-a77e-473e-98a2-bcb41eddeb51@oss.qualcomm.com>
 <143ae906-d6a5-40d4-8573-68fe798cdcfa@kernel.org>
Content-Language: en-US
In-Reply-To: <143ae906-d6a5-40d4-8573-68fe798cdcfa@kernel.org>
X-Proofpoint-ORIG-GUID: b2kiTDj0mzYwUGLeJMZm5JADp_jVWi8c
X-Proofpoint-GUID: b2kiTDj0mzYwUGLeJMZm5JADp_jVWi8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNyBTYWx0ZWRfX3nG8O6JyXKHu
 K03pmTbOlaJ8znuly3w5XIFd4rjAbokw0zjeGxViIumKyOokOjP2T5Kz/V8gxA9jayP4qP/CUQL
 A5re2ukdTD8y/E5UHrLHPs8k1gb75rTklsbK33YScwM3FBtmxrYn+Y4amz5mUKk/sY5dXytRofe
 qXfWvayhBaUcaEOFw2OQ1OTNLuq3EtBAxINvxVXULnbrC/sorfWYnzyiaa6NP9a2kz/tHVXhnye
 36KokrK3p5GSYrX8CPOGmxLnwmpYViyNlhO6BuDiNqg9kRylmKBKO57+0hZ6HoVRRzH01ihZxhP
 Lu7c68pNRHggCTulBRAc4XWTq6nWRMXpWTK4j01zzjRiSWV9WoZelGhnc53tbwbWe7b9Z6qizrQ
 UFQzpAs1Q72N9/5BhgiEDz1iIwggVcQl28Xu0eydUmUi3FpmR6yFoCN6jLaV+xHNssJS9/jt+lT
 plCZfznFSKPLAYXVukQ==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e624e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=FP58Ms26AAAA:8 a=EUspDBNiAAAA:8 a=CW5iuYeELDosS6GPhV0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200127
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/17/2026 10:11 AM, Chao Yu wrote: > On 4/14/2026 2:56
 PM, Xiaosen wrote: >> >> On 4/13/2026 10:42 PM, Xiaosen via Linux-f2fs-devel
 wrote: >>> >>> On 4/13/2026 7:54 PM, Chao Yu wrote: >>>> On 4/10 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wEoL4-0003MT-Be
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
From: Xiaosen He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Xiaosen He <xiaosen.he@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: 3D90442B3C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMTcvMjAyNiAxMDoxMSBBTSwgQ2hhbyBZdSB3cm90ZToKPiBPbiA0LzE0LzIwMjYgMjo1
NiBQTSwgWGlhb3NlbiB3cm90ZToKPj4KPj4gT24gNC8xMy8yMDI2IDEwOjQyIFBNLCBYaWFvc2Vu
IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4KPj4+IE9uIDQvMTMvMjAyNiA3OjU0IFBN
LCBDaGFvIFl1IHdyb3RlOgo+Pj4+IE9uIDQvMTAvMjAyNiA2OjUzIFBNLCBYaWFvc2VuIEhlIHdy
b3RlOgo+Pj4+PiBrd29ya2VyL3UzMjo3KGYyZnMgd3JpdGViYWNrIHRocmVhZCkgd2FzIHRyeWlu
ZyB0byBhY3F1aXJlCj4+Pj4+IHNiaS0+d3JpdGVwYWdlcywgdGhlIG11dGV4IHdhcyBhbHJlYWR5
IGFjcXVpcmVkIGJ5IGVtdWxhdGVkOzAuCj4+Pj4+IGt3b3JrZXIvdTMyOjcgdHJpZWQgdG8gZmx1
c2ggcGx1Z2dlZCBJTyBiZWZvcmUgc2xlZXAsIGR1cmluZwo+Pj4+PiBmbHVzaGluZyBwbHVnIGxp
c3QsIGt3b3JrZXIvdTMyOjcgZ290IHByZWVtcHRlZCBpbiBSQ1UgcmVhZC1zaWRlCj4+Pj4+IGNy
aXRpY2FsIHNlY3Rpb24gYW5kIGdvdCBzY2hlZHVsZWQgb3V0IHdhaXRpbmcgdG8gYmUgd29rZW4g
dXAgYnkKPj4+Pj4gdGhlIHJlbGVhc2Ugb2YgbXV0ZXguIGVtdWxhdGVkOzAgd2FzIGJsb2NrZWQg
b24gYmxrX21xX2dldF90YWcKPj4+Pj4gYXMgdGhlcmUgd2FzIG5vIGF2YWlsYWJsZSB0YWcgYW5k
IGV4cGVjdGVkIHRoZSBwcmV2aW91cyBJTwo+Pj4+PiByZXF1ZXN0cyB0byBiZSBoYW5kbGVkIGJ5
IFVGUyBob3N0IHRvIHJlbGVhc2UgdGFncywgYnV0IFVGUyBob3N0Cj4+Pj4+IHdhcyBibG9ja2Vk
IG9uIHN5bmNocm9uaXplX3JjdSB3YWl0aW5nIGZvciBlbmRpbmcgb2YgUkNVIGdyYWNlCj4+Pj4+
IHBlcmlvZC4gdGhlIGRlYWRsb2NrIHdhcyBjYXVzZWQgYnkgd3JpdGViYWNrIHRocmVhZCB3YXMg
c3R1Y2sgaW4KPj4+Pj4gUkNVIGNyaXRpY2FsIHNlY3Rpb24gd2FpdGluZyBmb3IgbXV0ZXguIGNh
bGwgYmxrX2ZsdXNoX3BsdWcoKSBpZgo+Pj4+PiBtdXRleF90cnlsb2NrKCZzYmktPndyaXRlcGFn
ZXMpIGZhaWxlZCwgc28gdGhhdCB0aGUgcGx1ZyBsaXN0IGlzCj4+Pj4+IGVtcHR5IHdoZW4gYmxr
X2ZsdXNoX3BsdWcoKSBpcyBjYWxsZWQgaW4gc2NoZWRfc3VibWl0X3dvcmsgdG8KPj4+Pj4gZml4
IHRoZSBkZWFkbG9jay4KPj4+Pgo+Pj4+IElNTywgbG9vayBtb3JlIGxpa2UgYSBjb21tb24gYnVn
PyBvdGhlcndpc2UsIHNvdW5kcyBsaWtlIHdlIGNhbiBub3QKPj4+PiBncmFiIG11dGV4IGxvY2sg
dy8gbXV0ZXhfbG9jayBkaXJlY3RseSBkdXJpbmcgd3JpdGViYWNrIGluIAo+Pj4+IC53cml0ZXBh
Z2VzPwo+Pj4+Cj4+IEluIHdyaXRlYmFjayB0aHJlYWQsIHRoZSBjYWxsIHBhdGggd291bGQgYmUg
YXMgZm9sbG93cy4KPj4gYmxrX3N0YXJ0X3BsdWcKPj4gbXV0ZXhfbG9jawo+PiB3cml0ZWJhY2sg
ZmlsZSBBCj4+IG11dGV4X3VubG9jawo+PiBtdXRleHRfbG9jawo+PiB3cml0ZWJhY2sgZmlsZSBC
Cj4+IG11dGV4X3VubG9jawo+PiAuLi4uLi4KPj4gYmxrX2ZpbmlzaF9wbHVnCj4+Cj4+IFNvLCBt
b3N0IHByb2JhYmx5IHdoZW4gdGhlIHRocmVhZCBmYWlsZWQgdG8gYWNxdWlyZSB0aGUgbXV0ZXgg
Zm9yIAo+PiB3cml0aW5nIGJhY2sgYQo+PiBmaWxlJ3MgZGF0YSwgdGhlIGJsb2NrIHBsdWcgbGlz
dCBpcyBub3QgZW1wdHkgYXMgdGhlIHByZXZpb3VzbHkgCj4+IGhhbmRsZWQgZmlsZXMnCj4+IGRh
dGHCoCBoYXZlIGJlZW4gcHJlcGFyZWQgYXMgd3JpdGUgcmVxdWVzdHMgYW5kIHBsdWdnZWQgb24g
dGhlIGxpc3QuCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqAgVGFzayBuYW1lOiBrd29ya2VyL3UzMjo3
wqDCoMKgIFthZmZpbml0eTogMHhmZl0gcGlkOiAyMzMgCj4+Pj4+IHRnaWQ6wqDCoMKgIDIzMyBj
cHU6IDYgcHJpbzogOTggc3RhcnQ6IDB4ZmZmZmZmODA5OTM5MDA0MAo+Pj4+PiDCoMKgwqDCoMKg
IHN0YXRlOiAweDJbRF0gZXhpdF9zdGF0ZTogMHgwIHN0YWNrIGJhc2U6IDB4ZmZmZmZmYzA4M2M0
ODAwMAo+Pj4+PiDCoMKgwqDCoMKgIExhc3RfZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2OTM5
NTg3NyBMYXN0X3NsZWVwX3RzOiAKPj4+Pj4gMzg5Ljc1NjYzOTU3NAo+Pj4+PiDCoMKgwqDCoMKg
IFN0YWNrOgo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9fc3dpdGNoX3Rv
KzB4MjE0Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFkZWI4Pl0gX19zY2hlZHVsZSsw
eGEzMAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTc1ND5dIHByZWVtcHRfc2NoZWR1
bGVfbm90cmFjZSsweDY4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOWRkZjM4Pl0gcmN1
X2lzX3dhdGNoaW5nW2p0XSsweDVjCj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTk5NWI4
Pl0gbG9ja19hY3F1aXJlKzB4NjgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTg3MGM+
XSByY3VfbG9ja19hY3F1aXJlKzB4MzQKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTg3
NjQ+XSBwZXJjcHVfcmVmX3B1dF9tYW55KzB4MjAKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZmZTNhNjQ+XSBibGtfbXFfZGlzcGF0Y2hfbGlzdCsweDU3MAo+Pj4+PiDCoMKgwqDCoMKgIFs8
ZmZmZmZmZDM5ZmZlMzI2ND5dIGJsa19tcV9mbHVzaF9wbHVnX2xpc3QrMHgxM2MKPj4+Pj4gwqDC
oMKgwqDCoCBbPGZmZmZmZmQzOWZmZDQzYTg+XSBfX2Jsa19mbHVzaF9wbHVnKzB4MTFjCj4+Pj4K
Pj4+PiBJdCB0cmllcyB0byBmbHVzaCBwbHVnIGxpc3QgaW5zaWRlIG11dGV4X2xvY2soKSBhbmQg
dGhlbiBiZSAKPj4+PiBibG9ja2VkLiBXaWxsIGl0IGNhdXNlCj4+Pj4gdGhlIHNhbWUgaXNzdWUg
dy8geW91ciBiZWxvdyBpbXBsZW1lbnRhdGlvbjoKPj4+Pgo+Pj4+IGlmICghbXV0ZXhfdHJ5bG9j
aygmc2JpLT53cml0ZXBhZ2VzKSkKPj4+PiDCoMKgwqDCoMKgYmxrX2ZsdXNoX3BsdWcoKChzdHJ1
Y3QgdGFza19zdHJ1Y3QgKiljdXJyZW50KS0+cGx1ZywgdHJ1ZSk7IAo+Pj4+IDwtLS0gaGVyZQo+
Pj4KPj4+IElmIGJsa19mbHVzaF9wbHVnIGlzIGNhbGxlZCBoZXJlLCB3aGVuIHByZWVtcHRpb24g
aGFwcGVuZWQgaW4gUkNVIAo+Pj4gY3JpdGljYWwKPj4+Cj4+PiBzZWNpdG9uLCB0aGUgdGFzayB3
b3VsZCBiZSBzY2hlZHVsZWQgb3V0IGluIFIgc3RhdGUsIHNvIHRoYXQgdGhlIAo+Pj4gdGFzayBj
YW4gYmUKPj4+Cj4+PiBzY2hlZHVsZWQgaW4gcXVpY2tseSB0byBlbmQgUkNVIGdyYWNlIHBlcmlv
ZCwgdGhlbiBpdCB3b24ndCBibG9jayAKPj4+IFVGUyBob3N0Lgo+Pj4KPj4+IFJlZ2FyZHMsCj4+
Pgo+Pj4gWGlhb3Nlbgo+Pj4KPj4+PiAuLi4KPj4+PiBtdXRleF9sb2NrKCZzYmktPndyaXRlcGFn
ZXMpOwo+Pj4+Cj4+Pj4gTGV0IG1lIGtub3cgaWYgSSdtIG1pc3NpbmcgYW55dGhpbmcuCj4+Pj4K
Pj4+PiBUaGFua3MsCj4+IGt3b3JrZXIvdTMyOjIgKHdyaXRlYmFjayB0aHJlYWQpCj4+IF9fbXV0
ZXhfbG9ja19jb21tb24KPj4gwqAgwqAgc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19VTklOVEVSUlVQ
VElCTEUpOwo+PiDCoCDCoCBzY2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkCj4+IMKgIMKgIMKgIHNj
aGVkdWxlCj4+IMKgIMKgIMKgIMKgIHNjaGVkX3N1Ym1pdF93b3JrCj4+IMKgIMKgIMKgIMKgIMKg
IGJsa19mbHVzaF9wbHVnCj4+IMKgIMKgIMKgIMKgIMKgIMKgIF9fYmxrX2ZsdXNoX3BsdWcKPj4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgYmxrX21xX2ZsdXNoX3BsdWdfbGlzdAo+PiDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBibGtfbXFfZGlzcGF0Y2hfbGlzdAo+PiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBwZXJjcHVfcmVmX3B1dAo+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBw
ZXJjcHVfcmVmX3B1dF9tYW55Cj4+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJj
dV9yZWFkX2xvY2sKPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHJlZW1w
dF9zY2hlZHVsZV9ub3RyYWNlCj4+Cj4+IEluIF9fbXV0ZXhfbG9ja19zbG93cGF0aCwgdGhlIHRh
c2sncyBzdGF0ZSBpcyBzZXQgdG8gCj4+IFRBU0tfVU5JTlRFUlJVUFRJQkxFLCB0aGVuCj4KPiBP
aCwgSSBzZWUsIGl0J3MgVEFTS19VTklOVEVSUlVQVElCTEUgc3RhdGUgYW5kIGJlIHByZWVtcHRl
ZCwgc2hvdWxkbid0IAo+IHdlIHNldAo+IFRBU0tfSU5URVJSVVBUSUJMRSBzdGF0ZSBiZWZvcmUg
aXQgcnVucyBpbnRvIHJjdSBjcml0aWNhbCByZWdpb24/IE5vdCAKPiBzdXJlLCBidXQKPiBJIHN1
c3BlY3QgaXQncyBhIGJ1ZyBmcm9tIGNvbW1vbiBtdXRleGxvY2svYmxvY2svdWZzIG1vZHVsZXMg
cmF0aGVyIAo+IHRoYW4gZjJmcycuCj4KPiBTaW5jZSBpdCdzIGhhcmQgdG8gY2hhbmdlIGNvbW1v
biBtb2R1bGUsIG9yIGNhbiB3ZSBjb25zaWRlciB0byB1c2UgCj4gcndzZW0gbG9jawo+IGluc3Rl
YWQgb2YgbXV0ZXggbG9jayBpbiAud3JpdGVwYWdlcz8gSSBzdXNwZWN0IHdlIG1heSBzdWZmZXIg
cGVyZm9ybWFuY2UKPiByZWdyZXNzaW9uIGlmIHdlIGZsdXNoIHBsdWcgbGlzdCBpbiBhZHZhbmNl
IGJlZm9yZSBtdXRleF9sb2NrLgo+Cj4gQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBzb21lIHBlcmZvcm1h
bmNlIG51bWJlcnMgZm9yIGJvdGggbXV0ZXggYW5kIHJ3c2VtIAo+IHZlcnNpb24/Cj4KPiBUaGFu
a3MsCgpBIHRhc2sgd291bGQgYmUgc2V0IHRvIFRBU0tfVU5JTlRFUlJVUFRJQkxFIHRoZW4gY2Fs
bCAKc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZAoKYWxzbyBpZiBmYWlsZWQgdG8gYWNxdWlyZcKg
cndzZW0gbG9jaywgYW5kIHRoZSB0YXNrIHdpbGwgZW5jb3VudGVyIApzaW1pbGFyIGRlYWRsb2Nr
LgoKSWYgdGhlIG11dGV4IGhhcyBhbHJlYWR5IGJlZW4gYWNxdWlyZWQgYnkgYW5vdGhlciB0YXNr
LCB0aGUgd3JpdGViYWNrIAp0aHJlYWQgd291bGQgZmx1c2gKCnBsdWcgbGlzdCBhbnl3YXkuIEFu
ZCB0aGUgcGx1ZyBsaXN0IGlzIGVtcHR5IHdoZW4ganVzdCB3cml0ZSBiYWNrIGEgCnNpbmdsZSBm
aWxlJ3MgZGF0YS4KCkkgZG9uJ3QgdGhpbmsgaXQgd2lsbCBtYWtlIGJpZyBkaWZmZXJlbmNlIHRv
IHBlcmZvcm1hbmNlLgoKSSBjYW4gZ2l2ZSBwZXJmb3JtYW5jZSBudW1iZXJzIGlmIHlvdSBpbnNp
c3QuCgpSZWdhcmRzLAoKWGlhb3NlbgoKPgo+PiBjYWxsIGJsa19mbHVzaF9wbHVnIGxhdGVyLCBz
byBvbmNlIHByZWVtcHRpb24gaGFwcGVuZWQgaW4gUkNVIAo+PiBjcml0aWNhbCBzZWN0aW9uLAo+
PiB0aGUgdGFzayB3b3VsZCBiZSBzdHVjayBpbiBSQ1UgY3JpdGljYWwgc2VjdGlvbiB3YWl0aW5n
IGZvciB0aGUgCj4+IHJlbGVhc2Ugb2YgbXV0ZXguCj4+IFJlZ2FyZGluZyBteSBmaXgsIGluIG11
dGV4X3RyeWxvY2ssIGl0IHdvbid0IGNhbGwgYmxrX2ZsdXNoX3BsdWcgaWYgCj4+IG11dGV4X3Ry
eWxvY2sKPj4gZmFpbGVkLiBMZXQncyBmbHVzaCBwbHVnIGxpc3QgaWYgbXV0ZXhfdHJ5bG9jayBm
YWlsZWQsIHNvIHRoYXQgd2hlbiAKPj4gaXQgZ29lcyB0bwo+PiBtdXRleF9sb2NrIGFuZCBmYWls
ZWQgdG8gYWNxdWlyZSB0aGUgbXV0ZXgsIHRoZSBsYXRlciBjYWxsIHRvIAo+PiBibGtfZmx1c2hf
cGx1Zwo+PiB3b3VsZCBiZSBzaW1wbGUgYXMgdGhlIHBsdWcgbGlzdCBpcyBlbXB0eSBhbmQgdGhl
cmUgaXMgbm8gY2hhbmNlIHRvIAo+PiBnbyB0bwo+PiByY3VfcmVhZF9sb2NrLgo+Pgo+PiBSZWdh
cmRzLAo+PiBYaWFvc2VuCj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5M2U2YzQ+
XSBzY2hlZF9zdWJtaXRfd29yaysweDc4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFl
NGQ4Pl0gc2NoZWR1bGUrMHgzOAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTVjND5d
IHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQrMHgxOAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZm
ZDNhMGIyMGM3Yz5dIF9fbXV0ZXhfbG9ja19jb21tb24rMHhhYjgKPj4+Pj4gwqDCoMKgwqDCoCBb
PGZmZmZmZmQzYTBiMjAwODQ+XSBtdXRleF9sb2NrX25lc3RlZCsweDJjCj4+Pj4+IMKgwqDCoMKg
wqAgWzxmZmZmZmZkMzlmZWVhNzJjPl0gZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4ZDY0Cj4+Pj4+
IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIzOTU4Pl0gZG9fd3JpdGVwYWdlcysweGQ0Cj4+Pj4+
IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5ZmQ4Pl0gX193cml0ZWJhY2tfc2luZ2xlX2lub2Rl
KzB4NzgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZkMDk5NTg+XSB3cml0ZWJhY2tfc2Jf
aW5vZGVzKzB4MmI4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5Y2MwPl0gX193cml0
ZWJhY2tfaW5vZGVzX3diKzB4YTAKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZkMDkwNTQ+
XSB3Yl93cml0ZWJhY2srMHgxODgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZkMDY2ZDA+
XSB3Yl93b3JrZm5banRdKzB4NDM4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTE5OGUw
Pl0gcHJvY2Vzc19vbmVfd29yaysweDI3Ywo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5Zjkx
YmFmOD5dIHdvcmtlcl90aHJlYWQrMHgzNTgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5
MjQ1MzQ+XSBrdGhyZWFkKzB4MTUwCj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmODMwZTQ0
Pl0gcmV0X2Zyb21fZm9yaysweDEwCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqAgVGFzayBuYW1lOiBr
d29ya2VyL3UzMjoywqDCoMKgIFthZmZpbml0eTogMHhmZl0gcGlkOsKgwqDCoMKgIDkwIAo+Pj4+
PiB0Z2lkOsKgwqDCoMKgIDkwIGNwdTogMSBwcmlvOiAxMjAgc3RhcnQ6IDB4ZmZmZmZmODBhZGFl
ODA0MAo+Pj4+PiDCoMKgwqDCoMKgIHN0YXRlOiAweDJbRF0gZXhpdF9zdGF0ZTogMHgwIHN0YWNr
IGJhc2U6IDB4ZmZmZmZmYzA4MGExODAwMAo+Pj4+PiDCoMKgwqDCoMKgIExhc3RfZW5xdWV1ZWRf
dHM6wqDCoMKgwqAgMzg5Ljg5OTYwODYzNyBMYXN0X3NsZWVwX3RzOiAKPj4+Pj4gMzg5Ljg5OTY2
NTMwMwo+Pj4+PiDCoMKgwqDCoMKgIFN0YWNrOgo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNh
MGIxZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkM2Ew
YjFkZWI4Pl0gX19zY2hlZHVsZSsweGEzMAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIx
ZTRlOD5dIHNjaGVkdWxlKzB4NDgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGZhNjQ+
XSBzeW5jaHJvbml6ZV9yY3VfZXhwZWRpdGVkKzB4OTI4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZm
ZmZkMzlmOWRlZWIwPl0gc3luY2hyb25pemVfcmN1W2p0XSsweDIzNAo+Pj4+PiDCoMKgwqDCoMKg
IFs8ZmZmZmZmZDM5ZmZkZTVkND5dIGJsa19tcV9xdWllc2NlX3RhZ3NldFtqdF0rMHhhOAo+Pj4+
PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2Q5MD5dIHVmc2hjZF9kZXZmcmVxX3NjYWxlKzB4
OTAKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTA2MWNhNmM+XSB1ZnNoY2RfZGV2ZnJlcV90
YXJnZXQrMHgyMDQKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTA2ZGUyNDQ+XSBkZXZmcmVx
X3NldF90YXJnZXQrMHhiOAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDZkZTE0Yz5dIGRl
dmZyZXFfdXBkYXRlX3RhcmdldFtqdF0rMHhkOAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNh
MDZkZTVlOD5dIGRldmZyZXFfbW9uaXRvcisweDM4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZk
MzlmOTE5OGUwPl0gcHJvY2Vzc19vbmVfd29yaysweDI3Ywo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZjkxYmFmOD5dIHdvcmtlcl90aHJlYWQrMHgzNTgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZm
ZmZmZmQzOWY5MjQ1MzQ+XSBrdGhyZWFkKzB4MTUwCj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZk
MzlmODMwZTQ0Pl0gcmV0X2Zyb21fZm9yaysweDEwCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqAgVGFz
ayBuYW1lOiBlbXVsYXRlZDswwqDCoMKgwqDCoMKgIFthZmZpbml0eTogMHhmZl0gcGlkOiA1MjQ1
IAo+Pj4+PiB0Z2lkOsKgwqAgNDkyMiBjcHU6IDYgcHJpbzogMTIwIHN0YXJ0OiAweGZmZmZmZjg5
ZTJlNjAwNDAKPj4+Pj4gwqDCoMKgwqDCoCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6IDB4MCBz
dGFjayBiYXNlOiAweGZmZmZmZmMwZDQyZjgwMDAKPj4+Pj4gwqDCoMKgwqDCoCBMYXN0X2VucXVl
dWVkX3RzOsKgwqDCoMKgIDM5MC4xNjkzOTU4NzcgTGFzdF9zbGVlcF90czogCj4+Pj4+IDM5MC4x
Nzg0NTk3MzEKPj4+Pj4gwqDCoMKgwqDCoCBTdGFjazoKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZm
ZmQzYTBiMWQyNTQ+XSBfX3N3aXRjaF90bysweDIxNAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZm
ZDNhMGIxZGViOD5dIF9fc2NoZWR1bGUrMHhhMzAKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQz
YTBiMWU0ZTg+XSBzY2hlZHVsZSsweDQ4Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFl
OGY0Pl0gaW9fc2NoZWR1bGUrMHgzOAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlYjEx
MD5dIGJsa19tcV9nZXRfdGFnKzB4MWE0Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmRl
ZGM4Pl0gX19ibGtfbXFfYWxsb2NfcmVxdWVzdHMrMHgzNTgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZm
ZmZmZmQzOWZmZTQwOWM+XSBibGtfbXFfc3VibWl0X2JpbysweDUwYwo+Pj4+PiDCoMKgwqDCoMKg
IFs8ZmZmZmZmZDM5ZmZkNGNiOD5dIF9fc3VibWl0X2Jpb1tqdF0rMHgxNjQKPj4+Pj4gwqDCoMKg
wqDCoCBbPGZmZmZmZmQzOWZmZDJlN2M+XSBzdWJtaXRfYmlvX25vYWNjdF9ub2NoZWNrKzB4MTRj
Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmQzMzk0Pl0gc3VibWl0X2Jpb19ub2FjY3Qr
MHgzMzAKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZDM4MTQ+XSBzdWJtaXRfYmlvKzB4
MWY0Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWUyYmE4Pl0gZjJmc19zdWJtaXRfd3Jp
dGVfYmlvKzB4ODgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTQxM2M+XSBfX3N1Ym1p
dF9tZXJnZWRfYmlvW2p0XSsweGJjCj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWUzYzRj
Pl0gZjJmc19zdWJtaXRfcGFnZV93cml0ZSsweDQwMAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZm
ZDM5ZmYwNGFhYz5dIGRvX3dyaXRlX3BhZ2UrMHgxODAKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZm
ZmQzOWZmMDRjYTA+XSBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGErMHg3OAo+Pj4+PiDCoMKgwqDC
oMKgIFs8ZmZmZmZmZDM5ZmVlODhkND5dIGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlKzB4MzkwCj4+
Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWU4ZGYwPl0gZjJmc193cml0ZV9zaW5nbGVfZGF0
YV9wYWdlKzB4MWUwCj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWVhMjg4Pl0gZjJmc193
cml0ZV9kYXRhX3BhZ2VzKzB4OGMwCj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIzOTU4
Pl0gZG9fd3JpdGVwYWdlcysweGQ0Cj4+Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmExNTNj
Pl0gX19maWxlbWFwX2ZkYXRhd3JpdGVfcmFuZ2UrMHg5NAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZmJiMDM3MD5dIGdlbmVyaWNfZmFkdmlzZSsweDFkOAo+Pj4+PiDCoMKgwqDCoMKgIFs8
ZmZmZmZmZDM5ZmVhYmFhMD5dIGYyZnNfZmlsZV9mYWR2aXNlKzB4MTI0Cj4+Pj4+IMKgwqDCoMKg
wqAgWzxmZmZmZmZkMzlmYmIwNTcwPl0gX19hcm02NF9zeXNfZmFkdmlzZTY0XzY0KzB4NzAKPj4+
Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4NDdlN2M+XSBpbnZva2Vfc3lzY2FsbCsweDU4Cj4+
Pj4+IMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmODQ3ZGE0Pl0gZWwwX3N2Y19jb21tb25banRdKzB4
YjgKPj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4NDdkMTg+XSBkb19lbDBfc3ZjKzB4MWMK
Pj4+Pj4gwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMTRmYWM+XSBlbDBfc3ZjKzB4NDAKPj4+Pj4g
wqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMTRlZjg+XSBlbDB0XzY0X3N5bmNfaGFuZGxlcltqdF0r
MHhkMAo+Pj4+PiDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjgxMTZhMD5dIHJldF90b191c2VyW2p0
XSsweDAKPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWGlhb3NlbiBIZSA8eGlhb3Nlbi5oZUBv
c3MucXVhbGNvbW0uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqDCoCBmcy9mMmZzL2RhdGEuYyB8IDYg
KysrKysrCj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+PiBp
bmRleCAzMzhkZjdhMmFlYTYuLmM4ZTgxZjYzZmU3MyAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gQEAgLTM1ODUsNyArMzU4
NSwxMyBAQCBzdGF0aWMgaW50IF9fZjJmc193cml0ZV9kYXRhX3BhZ2VzKHN0cnVjdCAKPj4+Pj4g
YWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoCDC
oMKgwqDCoMKgIGlmIChfX3Nob3VsZF9zZXJpYWxpemVfaW8oaW5vZGUsIHdiYykpIHsKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmICghbXV0ZXhfdHJ5bG9jaygmc2JpLT53cml0ZXBhZ2VzKSkKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrX2ZsdXNoX3BsdWcoKChzdHJ1Y3QgdGFza19z
dHJ1Y3QgKiljdXJyZW50KS0+cGx1ZywgCj4+Pj4+IHRydWUpOwo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgZWxzZQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9sb2NrZWQ7Cj4+
Pj4+ICsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmc2JpLT53cml0ZXBh
Z2VzKTsKPj4+Pj4gK3NldF9sb2NrZWQ6Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvY2tl
ZCA9IHRydWU7Cj4+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
