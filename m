Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNk5KeUw6GlHGgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 04:22:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE8441627
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 04:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X0bOYbzcfp1rYJKKk0eQ8ugziTzyWzB6bqnLBLvO04=; b=a2hDwqNoViV6o6oYmeMbQk5omI
	mHRBu2NYPghWpUgTdTwPgDkOSU/SJVHC6l/0sfSGWAjftExhch821oCo3DocKgfA4yOJ1HFSY2NKu
	U1vGq3XS0vyYHKvnAd2/VWYDiHPGmCuPj6DZhT9ST5PfDlGuksq2p0qF7ZyB7PrF7Fis=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFNEJ-0007ZM-Jf;
	Wed, 22 Apr 2026 02:22:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosen.he@oss.qualcomm.com>) id 1wFNEH-0007Z6-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 02:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e1usmHMdJOYRj+MGygBWUmDQMfskxzFbvWgdq63RlF8=; b=dFzmgFWimrai8McHeFTvfzhVCr
 zOI3OZyVy1hOHAnjvLSyIKkAP6Qk6N3P+xDWA3eiSNMszzdQT+dbAxq4/8GOAPDJw6/Y0ipqPAsi0
 RcG0+tXDEKaIqNI50JnveSI1N+N74olOdkXDSLWPyF/c8zmwCoCZ207exa6KRU7vtjY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e1usmHMdJOYRj+MGygBWUmDQMfskxzFbvWgdq63RlF8=; b=X/vdJJXVb0aCE15xExwcWFhT9k
 mPE2kCv8iGQqJiSTdRSdcdOcIKsPwh0u7Jii8OdlR5uXg4yTNjx1WYo60eckZVkqNZlE5t75gb8U9
 IzDeyaXRJTr/iTDLnLFKQ2EavrT6mt2PGYB7+gBCViuFxnRxhXP8XrMmbnGHIjxLUUUo=;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFNEH-0007z6-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 02:22:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63LIa8hm3083043
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 22 Apr 2026 02:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e1usmHMdJOYRj+MGygBWUmDQMfskxzFbvWgdq63RlF8=; b=RlG6qC0y17mbGFh8
 J6M9HdHyNCwlXxGl9Dh098+lDBpkv3hbPWNejhjoNYcFoh8pOwOFp/CZhL5rgyPY
 1m27zSQbuI/5WZE+K/HGbf53X61lpRq4maXMxtkKkK1ZIuXD1KqNYiFIu6v8jZ/4
 fBP38207PNnxrwOZUwJG88nCNexjClE3dOFPUnZoRU0n2/W2jIVebcIn7KHAQXtd
 Hgwk7groLVCDrYhoSULOS2Uo1yls6rk4WWgPLK8AUQ6xus/ZhxPvkIVEa5thj19I
 soBezFR9rwkq3gInZ3a7EKyfRnNAfgauLg7i2v3ZkdpsbAzLW6RJNDZ/ncWOL+sD
 IhANOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmh99q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Apr 2026 02:22:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-35fb969a4c0so5617557a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Apr 2026 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776824526; x=1777429326;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e1usmHMdJOYRj+MGygBWUmDQMfskxzFbvWgdq63RlF8=;
 b=dR5cvxqSz2ZMLL1cK7fvRwV8po6jb8JzMc63VqOtfaOfpml/gLYNgH6e3RN85bUPNi
 l38ZlO0T7cSckq68ODVZjMRk3T/kOujrQMyBTTl2/oMIH0sY3UEl+F58voOPqvR++Nmo
 YWYjQkOG2mmCrpNLwyQjNj94k8MI1A7fxCofkSQnlfukOm7UKfe4MoCnKy0fXZqgKoN3
 HN4rcl2u99rIhxxaxHCxO6+95dWhH6PmjJfhlsImPJ3mzf9AyU/boe8xxQSZBcKk23WB
 9uPGN96OOnPPxYHnaMtylMWdjIbZd+FZWTCrBCaEt1vJE7LhUEr0yctQkxebNIS/1KYI
 Jv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776824526; x=1777429326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1usmHMdJOYRj+MGygBWUmDQMfskxzFbvWgdq63RlF8=;
 b=cbxaMAKmRt8ea8YPgZH99F/qpp/nKzb6T8+jaVhf1A3+PQ5C4gAfe3TCLtSJyg2WS2
 237ptZMK5NhuCqXJfNxv5sadCHfd8Y3pbfpJcLXNi4hKkq5qSO9iY03ke+XDNLCe9NRo
 kE33oLhWx+WXpDU8FJPGTnbJjSItgY6x+kVUP49yHB4rZ+EA2Mt40ufV6YpE46Yw2AMc
 d+adspuI0kyBlCX17WJxOiYcdr+D+oKWXMth1j2Vh9Idno2NOUKWuE8JrpvR7fiX3uXo
 Bnk0I51O27KRpocRKMhzTXfbTr4V0YasduWHk8CLPYDYK4p2hWUIOQ+l5ALEAuIoiaCy
 a9jA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pIdLZbyYYEu1lyH5TOgKCRru8kUdJt8PGN4h6geejG5mMrh3dkNCsshsP3RPygRbz5AwX9YwwTiG1l96/eES5@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3PXGO1twlRVeqfilfBCcGFN9zUEGcESyZIeCFFMF7xponKIz/
 75un7LO+ARSr9FEQ9fjq2Pp4yBWj4Z8Kk1Hh8LE+LhyoS9hMrW8cmLQxWBObs3lSUI40Ghz3Nrd
 yOlcsd29ZumpSJ3FuXkiMAvQwa+bvSM7Mojj4xzyNe7Elu9XZ0fIxFVkg6Uv0CPLTo+pzXSP2t5
 B81xbg
X-Gm-Gg: AeBDievBOcqO5bMZmjLU4/bgrBQnmWPfxLVBhgCqQ4uq39b6cBKeKVP7wAFrTR7Kv1a
 dj5O6x+44Z+I0hoCHtrPSIE0e0W6G4LN5fz+TDKmDWVQrbBjaBJzriOG+4jogQYxxBlucADvDR7
 e/qjzG4uE9/9G+yNVN8lHPHoNCVU1WQpv6pUb7gnZYUM2e5+B6RGLAxchGMNKOoyib9TAnKcrhU
 QIHzqVfpfZOj7Wgp1676r80d8fb2+/VqcmyWFcLsp9Kk7rRzJlFOOhAb8NPllGzxnGVMf+mJ065
 kW4k0G/cpRJv2U9yY9FUU7RV3bM5+anXRTljlnilo6gZf9wb5gTQiATkGVij6NefHlBhOYuSWmX
 cYI+QtDCemOpdM+48P03/pFRdTqrDS/9bpPuhy8Xwx6/hXx5WevsH3bulxMC43zEaDWa8uoAYcB
 IWuSJyWpPSEK5cepYcho7thRkG
X-Received: by 2002:a17:90a:da8f:b0:35f:c1cc:feee with SMTP id
 98e67ed59e1d1-361403c3263mr20470089a91.3.1776824526168; 
 Tue, 21 Apr 2026 19:22:06 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:35f:c1cc:feee with SMTP id
 98e67ed59e1d1-361403c3263mr20470056a91.3.1776824525545; 
 Tue, 21 Apr 2026 19:22:05 -0700 (PDT)
Received: from [10.249.30.24] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36141990bb6sm15564962a91.17.2026.04.21.19.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 19:22:05 -0700 (PDT)
Message-ID: <7293110b-3289-46ab-99e4-a07c762cad56@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 10:22:02 +0800
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
 <c91ba4f4-99ba-4ee4-be21-3b678e8b0093@oss.qualcomm.com>
 <cd4f543a-a1cc-46b9-a9db-b2fab46fe6c1@kernel.org>
Content-Language: en-US
In-Reply-To: <cd4f543a-a1cc-46b9-a9db-b2fab46fe6c1@kernel.org>
X-Proofpoint-GUID: 4DIRT4n4HQQMljKY3JQb2ch81TQV841X
X-Proofpoint-ORIG-GUID: 4DIRT4n4HQQMljKY3JQb2ch81TQV841X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAyMSBTYWx0ZWRfX8I8I5nUg+/Mh
 rbbJQwLsI2VTR97+SwPhiGFlp3DglPxypBLs0DpNQ9qcTabhY8oHQX8LMddS7v+vfKgcw+NEPvO
 hnCzVRXjEirXngygRgFc26rYM0/RV9007o5IbD2yjs4i2thcsxYD19ucR9Gqp6oSfYBKJpGL++H
 oNkCpY7KmoHT+jaNzG9OcOS4bmTdx/Y+5bejfUr3H9riQwf1S+CUr5TuYWXqkTnNOcZYaXi6nhK
 yNav9CuClU/6m3dtw3QGZUgrcbA7P/Z+U12kJHBu5kNfwcVazFGAamtci1bn5tGcgjw4xRA6GhU
 S0xg2zNvDBY2WEFDpphhRY4RaWFiyzLyI6DMOKdYYBcmrduwIJVnmBf1Sc01SmgX8dQOoMTZM3H
 6lKcKiRtBmcyv4GsjOfOBZEpcP5+qiw3jStMg0KaAGgD5k2OXJnrZm3MmX/+TVnX7FQ9SSehxKp
 fxLwdk77YwR4kmfjhvg==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e830cf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FP58Ms26AAAA:8 a=EUspDBNiAAAA:8 a=Ou4fPoesT5EbGJ2Jj-AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220021
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/22/2026 9:16 AM, Chao Yu wrote: > On 4/20/2026 9:06
 PM, Xiaosen He wrote: >> >> On 4/17/2026 10:11 AM,
 Chao Yu wrote: >>> On 4/14/2026
 2:56 PM, Xiaosen wrote: >>>> >>>> On 4/13/2026 10:42 PM, Xi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wFNEH-0007z6-Qh
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qualcomm.com:-,oss.qualcomm.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[xiaosen.he@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CDE8441627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMjIvMjAyNiA5OjE2IEFNLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDQvMjAvMjAyNiA5OjA2
IFBNLCBYaWFvc2VuIEhlIHdyb3RlOgo+Pgo+PiBPbiA0LzE3LzIwMjYgMTA6MTEgQU0sIENoYW8g
WXUgd3JvdGU6Cj4+PiBPbiA0LzE0LzIwMjYgMjo1NiBQTSwgWGlhb3NlbiB3cm90ZToKPj4+Pgo+
Pj4+IE9uIDQvMTMvMjAyNiAxMDo0MiBQTSwgWGlhb3NlbiB2aWEgTGludXgtZjJmcy1kZXZlbCB3
cm90ZToKPj4+Pj4KPj4+Pj4gT24gNC8xMy8yMDI2IDc6NTQgUE0sIENoYW8gWXUgd3JvdGU6Cj4+
Pj4+PiBPbiA0LzEwLzIwMjYgNjo1MyBQTSwgWGlhb3NlbiBIZSB3cm90ZToKPj4+Pj4+PiBrd29y
a2VyL3UzMjo3KGYyZnMgd3JpdGViYWNrIHRocmVhZCkgd2FzIHRyeWluZyB0byBhY3F1aXJlCj4+
Pj4+Pj4gc2JpLT53cml0ZXBhZ2VzLCB0aGUgbXV0ZXggd2FzIGFscmVhZHkgYWNxdWlyZWQgYnkg
ZW11bGF0ZWQ7MC4KPj4+Pj4+PiBrd29ya2VyL3UzMjo3IHRyaWVkIHRvIGZsdXNoIHBsdWdnZWQg
SU8gYmVmb3JlIHNsZWVwLCBkdXJpbmcKPj4+Pj4+PiBmbHVzaGluZyBwbHVnIGxpc3QsIGt3b3Jr
ZXIvdTMyOjcgZ290IHByZWVtcHRlZCBpbiBSQ1UgcmVhZC1zaWRlCj4+Pj4+Pj4gY3JpdGljYWwg
c2VjdGlvbiBhbmQgZ290IHNjaGVkdWxlZCBvdXQgd2FpdGluZyB0byBiZSB3b2tlbiB1cCBieQo+
Pj4+Pj4+IHRoZSByZWxlYXNlIG9mIG11dGV4LiBlbXVsYXRlZDswIHdhcyBibG9ja2VkIG9uIGJs
a19tcV9nZXRfdGFnCj4+Pj4+Pj4gYXMgdGhlcmUgd2FzIG5vIGF2YWlsYWJsZSB0YWcgYW5kIGV4
cGVjdGVkIHRoZSBwcmV2aW91cyBJTwo+Pj4+Pj4+IHJlcXVlc3RzIHRvIGJlIGhhbmRsZWQgYnkg
VUZTIGhvc3QgdG8gcmVsZWFzZSB0YWdzLCBidXQgVUZTIGhvc3QKPj4+Pj4+PiB3YXMgYmxvY2tl
ZCBvbiBzeW5jaHJvbml6ZV9yY3Ugd2FpdGluZyBmb3IgZW5kaW5nIG9mIFJDVSBncmFjZQo+Pj4+
Pj4+IHBlcmlvZC4gdGhlIGRlYWRsb2NrIHdhcyBjYXVzZWQgYnkgd3JpdGViYWNrIHRocmVhZCB3
YXMgc3R1Y2sgaW4KPj4+Pj4+PiBSQ1UgY3JpdGljYWwgc2VjdGlvbiB3YWl0aW5nIGZvciBtdXRl
eC4gY2FsbCBibGtfZmx1c2hfcGx1ZygpIGlmCj4+Pj4+Pj4gbXV0ZXhfdHJ5bG9jaygmc2JpLT53
cml0ZXBhZ2VzKSBmYWlsZWQsIHNvIHRoYXQgdGhlIHBsdWcgbGlzdCBpcwo+Pj4+Pj4+IGVtcHR5
IHdoZW4gYmxrX2ZsdXNoX3BsdWcoKSBpcyBjYWxsZWQgaW4gc2NoZWRfc3VibWl0X3dvcmsgdG8K
Pj4+Pj4+PiBmaXggdGhlIGRlYWRsb2NrLgo+Pj4+Pj4KPj4+Pj4+IElNTywgbG9vayBtb3JlIGxp
a2UgYSBjb21tb24gYnVnPyBvdGhlcndpc2UsIHNvdW5kcyBsaWtlIHdlIGNhbiBub3QKPj4+Pj4+
IGdyYWIgbXV0ZXggbG9jayB3LyBtdXRleF9sb2NrIGRpcmVjdGx5IGR1cmluZyB3cml0ZWJhY2sg
aW4KPj4+Pj4+IC53cml0ZXBhZ2VzPwo+Pj4+Pj4KPj4+PiBJbiB3cml0ZWJhY2sgdGhyZWFkLCB0
aGUgY2FsbCBwYXRoIHdvdWxkIGJlIGFzIGZvbGxvd3MuCj4+Pj4gYmxrX3N0YXJ0X3BsdWcKPj4+
PiBtdXRleF9sb2NrCj4+Pj4gd3JpdGViYWNrIGZpbGUgQQo+Pj4+IG11dGV4X3VubG9jawo+Pj4+
IG11dGV4dF9sb2NrCj4+Pj4gd3JpdGViYWNrIGZpbGUgQgo+Pj4+IG11dGV4X3VubG9jawo+Pj4+
IC4uLi4uLgo+Pj4+IGJsa19maW5pc2hfcGx1Zwo+Pj4+Cj4+Pj4gU28sIG1vc3QgcHJvYmFibHkg
d2hlbiB0aGUgdGhyZWFkIGZhaWxlZCB0byBhY3F1aXJlIHRoZSBtdXRleCBmb3IKPj4+PiB3cml0
aW5nIGJhY2sgYQo+Pj4+IGZpbGUncyBkYXRhLCB0aGUgYmxvY2sgcGx1ZyBsaXN0IGlzIG5vdCBl
bXB0eSBhcyB0aGUgcHJldmlvdXNseQo+Pj4+IGhhbmRsZWQgZmlsZXMnCj4+Pj4gZGF0YcKgIGhh
dmUgYmVlbiBwcmVwYXJlZCBhcyB3cml0ZSByZXF1ZXN0cyBhbmQgcGx1Z2dlZCBvbiB0aGUgbGlz
dC4KPj4+Pj4+Pgo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBUYXNrIG5hbWU6IGt3b3JrZXIvdTMyOjfC
oMKgwqAgW2FmZmluaXR5OiAweGZmXSBwaWQ6IDIzMwo+Pj4+Pj4+IHRnaWQ6wqDCoMKgIDIzMyBj
cHU6IDYgcHJpbzogOTggc3RhcnQ6IDB4ZmZmZmZmODA5OTM5MDA0MAo+Pj4+Pj4+IMKgwqDCoMKg
wqDCoCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6IDB4MCBzdGFjayBiYXNlOiAweGZmZmZmZmMw
ODNjNDgwMDAKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgTGFzdF9lbnF1ZXVlZF90czrCoMKgwqDCoCAz
OTAuMTY5Mzk1ODc3IExhc3Rfc2xlZXBfdHM6Cj4+Pj4+Pj4gMzg5Ljc1NjYzOTU3NAo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoCBTdGFjazoKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFk
MjU0Pl0gX19zd2l0Y2hfdG8rMHgyMTQKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkM2Ew
YjFkZWI4Pl0gX19zY2hlZHVsZSsweGEzMAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
YTBiMWU3NTQ+XSBwcmVlbXB0X3NjaGVkdWxlX25vdHJhY2UrMHg2OAo+Pj4+Pj4+IMKgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzOWY5ZGRmMzg+XSByY3VfaXNfd2F0Y2hpbmdbanRdKzB4NWMKPj4+Pj4+
PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTk5NWI4Pl0gbG9ja19hY3F1aXJlKzB4NjgKPj4+
Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmU4NzBjPl0gcmN1X2xvY2tfYWNxdWlyZSsw
eDM0Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlODc2ND5dIHBlcmNwdV9yZWZf
cHV0X21hbnkrMHgyMAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTNhNjQ+XSBi
bGtfbXFfZGlzcGF0Y2hfbGlzdCsweDU3MAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZmZTMyNjQ+XSBibGtfbXFfZmx1c2hfcGx1Z19saXN0KzB4MTNjCj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgIFs8ZmZmZmZmZDM5ZmZkNDNhOD5dIF9fYmxrX2ZsdXNoX3BsdWcrMHgxMWMKPj4+Pj4+Cj4+
Pj4+PiBJdCB0cmllcyB0byBmbHVzaCBwbHVnIGxpc3QgaW5zaWRlIG11dGV4X2xvY2soKSBhbmQg
dGhlbiBiZQo+Pj4+Pj4gYmxvY2tlZC4gV2lsbCBpdCBjYXVzZQo+Pj4+Pj4gdGhlIHNhbWUgaXNz
dWUgdy8geW91ciBiZWxvdyBpbXBsZW1lbnRhdGlvbjoKPj4+Pj4+Cj4+Pj4+PiBpZiAoIW11dGV4
X3RyeWxvY2soJnNiaS0+d3JpdGVwYWdlcykpCj4+Pj4+PiDCoMKgwqDCoMKgwqBibGtfZmx1c2hf
cGx1ZygoKHN0cnVjdCB0YXNrX3N0cnVjdCAqKWN1cnJlbnQpLT5wbHVnLCB0cnVlKTsKPj4+Pj4+
IDwtLS0gaGVyZQo+Pj4+Pgo+Pj4+PiBJZiBibGtfZmx1c2hfcGx1ZyBpcyBjYWxsZWQgaGVyZSwg
d2hlbiBwcmVlbXB0aW9uIGhhcHBlbmVkIGluIFJDVQo+Pj4+PiBjcml0aWNhbAo+Pj4+Pgo+Pj4+
PiBzZWNpdG9uLCB0aGUgdGFzayB3b3VsZCBiZSBzY2hlZHVsZWQgb3V0IGluIFIgc3RhdGUsIHNv
IHRoYXQgdGhlCj4+Pj4+IHRhc2sgY2FuIGJlCj4+Pj4+Cj4+Pj4+IHNjaGVkdWxlZCBpbiBxdWlj
a2x5IHRvIGVuZCBSQ1UgZ3JhY2UgcGVyaW9kLCB0aGVuIGl0IHdvbid0IGJsb2NrCj4+Pj4+IFVG
UyBob3N0Lgo+Pj4+Pgo+Pj4+PiBSZWdhcmRzLAo+Pj4+Pgo+Pj4+PiBYaWFvc2VuCj4+Pj4+Cj4+
Pj4+PiAuLi4KPj4+Pj4+IG11dGV4X2xvY2soJnNiaS0+d3JpdGVwYWdlcyk7Cj4+Pj4+Pgo+Pj4+
Pj4gTGV0IG1lIGtub3cgaWYgSSdtIG1pc3NpbmcgYW55dGhpbmcuCj4+Pj4+Pgo+Pj4+Pj4gVGhh
bmtzLAo+Pj4+IGt3b3JrZXIvdTMyOjIgKHdyaXRlYmFjayB0aHJlYWQpCj4+Pj4gX19tdXRleF9s
b2NrX2NvbW1vbgo+Pj4+IMKgwqAgwqAgc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19VTklOVEVSUlVQ
VElCTEUpOwo+Pj4+IMKgwqAgwqAgc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZAo+Pj4+IMKgwqAg
wqAgwqAgc2NoZWR1bGUKPj4+PiDCoMKgIMKgIMKgIMKgIHNjaGVkX3N1Ym1pdF93b3JrCj4+Pj4g
wqDCoCDCoCDCoCDCoCDCoCBibGtfZmx1c2hfcGx1Zwo+Pj4+IMKgwqAgwqAgwqAgwqAgwqAgwqAg
X19ibGtfZmx1c2hfcGx1Zwo+Pj4+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYmxrX21xX2ZsdXNo
X3BsdWdfbGlzdAo+Pj4+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYmxrX21xX2Rpc3BhdGNo
X2xpc3QKPj4+PiDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBlcmNwdV9yZWZfcHV0Cj4+
Pj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwZXJjcHVfcmVmX3B1dF9tYW55Cj4+
Pj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByY3VfcmVhZF9sb2NrCj4+Pj4g
wqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwcmVlbXB0X3NjaGVkdWxlX25v
dHJhY2UKPj4+Pgo+Pj4+IEluIF9fbXV0ZXhfbG9ja19zbG93cGF0aCwgdGhlIHRhc2sncyBzdGF0
ZSBpcyBzZXQgdG8KPj4+PiBUQVNLX1VOSU5URVJSVVBUSUJMRSwgdGhlbgo+Pj4KPj4+IE9oLCBJ
IHNlZSwgaXQncyBUQVNLX1VOSU5URVJSVVBUSUJMRSBzdGF0ZSBhbmQgYmUgcHJlZW1wdGVkLCBz
aG91bGRuJ3QKPj4+IHdlIHNldAo+Pj4gVEFTS19JTlRFUlJVUFRJQkxFIHN0YXRlIGJlZm9yZSBp
dCBydW5zIGludG8gcmN1IGNyaXRpY2FsIHJlZ2lvbj8gTm90Cj4+PiBzdXJlLCBidXQKPj4+IEkg
c3VzcGVjdCBpdCdzIGEgYnVnIGZyb20gY29tbW9uIG11dGV4bG9jay9ibG9jay91ZnMgbW9kdWxl
cyByYXRoZXIKPj4+IHRoYW4gZjJmcycuCj4+Pgo+Pj4gU2luY2UgaXQncyBoYXJkIHRvIGNoYW5n
ZSBjb21tb24gbW9kdWxlLCBvciBjYW4gd2UgY29uc2lkZXIgdG8gdXNlCj4+PiByd3NlbSBsb2Nr
Cj4+PiBpbnN0ZWFkIG9mIG11dGV4IGxvY2sgaW4gLndyaXRlcGFnZXM/IEkgc3VzcGVjdCB3ZSBt
YXkgc3VmZmVyIAo+Pj4gcGVyZm9ybWFuY2UKPj4+IHJlZ3Jlc3Npb24gaWYgd2UgZmx1c2ggcGx1
ZyBsaXN0IGluIGFkdmFuY2UgYmVmb3JlIG11dGV4X2xvY2suCj4+Pgo+Pj4gQ2FuIHlvdSBwbGVh
c2UgZ2l2ZSBzb21lIHBlcmZvcm1hbmNlIG51bWJlcnMgZm9yIGJvdGggbXV0ZXggYW5kIHJ3c2Vt
Cj4+PiB2ZXJzaW9uPwo+Pj4KPj4+IFRoYW5rcywKPj4KPj4gQSB0YXNrIHdvdWxkIGJlIHNldCB0
byBUQVNLX1VOSU5URVJSVVBUSUJMRSB0aGVuIGNhbGwKPj4gc2NoZWR1bGVfcHJlZW1wdF9kaXNh
YmxlZAo+Pgo+PiBhbHNvIGlmIGZhaWxlZCB0byBhY3F1aXJlwqByd3NlbSBsb2NrLCBhbmQgdGhl
IHRhc2sgd2lsbCBlbmNvdW50ZXIKPj4gc2ltaWxhciBkZWFkbG9jay4KPgo+IE9oLCB3ZWxsLCB3
ZSB3aWxsIHN1ZmZlciB0aGUgc2FtZSBpc3N1ZSB3LyBpb19yd3NlbT8KPgo+IC0gd3JpdGVwYWdl
cwo+IMKgLSBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzCj4gwqAgLSBmMmZzX3dyaXRlX3NpbmdsZV9k
YXRhX3BhZ2UKPiDCoMKgIC0gZjJmc19kb193cml0ZV9kYXRhX3BhZ2UKPiDCoMKgwqAgLSBmMmZz
X291dHBsYWNlX3dyaXRlX2RhdGEKPiDCoMKgwqDCoCAtIGRvX3dyaXRlX3BhZ2UKPiDCoMKgwqDC
oMKgIC0gZjJmc19zdWJtaXRfcGFnZV93cml0ZQo+IMKgwqDCoMKgwqDCoCAtIGYyZnNfZG93bl93
cml0ZV90cmFjZShpb19yd3NlbSkKPiDCoMKgwqDCoMKgwqDCoMKgIDogY2FuIGJsb2NrIG9uIGJs
a19wbHVnX2ZsdXNoIC0+IHJjdV9yZWFkX2xvY2sgLT4gcHJlZW1wdAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG1lYW53aGlsZSBibGtfbXFfcXVpZXNjZV90YWdzZXQgd2lsbCBibG9jayBvbiBzeW5j
aHJvbml6ZV9yY3UKPiDCoMKgwqDCoMKgwqDCoCAtIF9fc3VibWl0X21lcmdlZF9iaW8KCkkgbm90
aWNlZCB0aGlzIHBhdGggdG9vLCBzbyB3ZSBhcmUgdHJ5aW5nIHRvIGZpeCB0aGUgZGVhZGxvY2sg
b3V0c2lkZSAKZmlsZXN5c3RlbXMKCm5vdy4gcGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLgoKPgo+
Pgo+PiBJZiB0aGUgbXV0ZXggaGFzIGFscmVhZHkgYmVlbiBhY3F1aXJlZCBieSBhbm90aGVyIHRh
c2ssIHRoZSB3cml0ZWJhY2sKPj4gdGhyZWFkIHdvdWxkIGZsdXNoCj4+Cj4+IHBsdWcgbGlzdCBh
bnl3YXkuIEFuZCB0aGUgcGx1ZyBsaXN0IGlzIGVtcHR5IHdoZW4ganVzdCB3cml0ZSBiYWNrIGEK
Pj4gc2luZ2xlIGZpbGUncyBkYXRhLgo+Pgo+PiBJIGRvbid0IHRoaW5rIGl0IHdpbGwgbWFrZSBi
aWcgZGlmZmVyZW5jZSB0byBwZXJmb3JtYW5jZS4KPj4KPj4gSSBjYW4gZ2l2ZSBwZXJmb3JtYW5j
ZSBudW1iZXJzIGlmIHlvdSBpbnNpc3QuCj4KPiBQbGVhc2UgZmlndXJlIG91dCBzb21lIG51bWJl
cnMsIEkgZ3Vlc3MgeW91IGNhbiBmbHVzaCBwbHVnIGxpc3Qgd2hlbmV2ZXIKPiB0cnlpbmcgdG8g
Z3JhYiBzYmktPndyaXRlcGFnZXMgbG9jayBpbiB0aGUgY29udHJvbCBncm91cCwgaXQgY2FuIGhl
bHAgdG8KPiBzaW11bGF0ZSB0aGUgZXh0cmVtZSBjYXNlLgo+Cj4gVGhhbmtzLAo+Cj4+Cj4+IFJl
Z2FyZHMsCj4+Cj4+IFhpYW9zZW4KPj4KPj4+Cj4+Pj4gY2FsbCBibGtfZmx1c2hfcGx1ZyBsYXRl
ciwgc28gb25jZSBwcmVlbXB0aW9uIGhhcHBlbmVkIGluIFJDVQo+Pj4+IGNyaXRpY2FsIHNlY3Rp
b24sCj4+Pj4gdGhlIHRhc2sgd291bGQgYmUgc3R1Y2sgaW4gUkNVIGNyaXRpY2FsIHNlY3Rpb24g
d2FpdGluZyBmb3IgdGhlCj4+Pj4gcmVsZWFzZSBvZiBtdXRleC4KPj4+PiBSZWdhcmRpbmcgbXkg
Zml4LCBpbiBtdXRleF90cnlsb2NrLCBpdCB3b24ndCBjYWxsIGJsa19mbHVzaF9wbHVnIGlmCj4+
Pj4gbXV0ZXhfdHJ5bG9jawo+Pj4+IGZhaWxlZC4gTGV0J3MgZmx1c2ggcGx1ZyBsaXN0IGlmIG11
dGV4X3RyeWxvY2sgZmFpbGVkLCBzbyB0aGF0IHdoZW4KPj4+PiBpdCBnb2VzIHRvCj4+Pj4gbXV0
ZXhfbG9jayBhbmQgZmFpbGVkIHRvIGFjcXVpcmUgdGhlIG11dGV4LCB0aGUgbGF0ZXIgY2FsbCB0
bwo+Pj4+IGJsa19mbHVzaF9wbHVnCj4+Pj4gd291bGQgYmUgc2ltcGxlIGFzIHRoZSBwbHVnIGxp
c3QgaXMgZW1wdHkgYW5kIHRoZXJlIGlzIG5vIGNoYW5jZSB0bwo+Pj4+IGdvIHRvCj4+Pj4gcmN1
X3JlYWRfbG9jay4KPj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gWGlhb3Nlbgo+Pj4+Pj4KPj4+Pj4+
PiBbPGZmZmZmZmQzOWY5M2U2YzQ+XSBzY2hlZF9zdWJtaXRfd29yaysweDc4Cj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTRkOD5dIHNjaGVkdWxlKzB4MzgKPj4+Pj4+PiDCoMKg
wqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlNWM0Pl0gc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZCsw
eDE4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIyMGM3Yz5dIF9fbXV0ZXhfbG9j
a19jb21tb24rMHhhYjgKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjIwMDg0Pl0g
bXV0ZXhfbG9ja19uZXN0ZWQrMHgyYwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZl
ZWE3MmM+XSBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHhkNjQKPj4+Pj4+PiDCoMKgwqDCoMKgwqAg
WzxmZmZmZmZkMzlmYmIzOTU4Pl0gZG9fd3JpdGVwYWdlcysweGQ0Cj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgIFs8ZmZmZmZmZDM5ZmQwOWZkOD5dIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDc4Cj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmQwOTk1OD5dIHdyaXRlYmFja19zYl9pbm9k
ZXMrMHgyYjgKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5Y2MwPl0gX193cml0
ZWJhY2tfaW5vZGVzX3diKzB4YTAKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5
MDU0Pl0gd2Jfd3JpdGViYWNrKzB4MTg4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5
ZmQwNjZkMD5dIHdiX3dvcmtmbltqdF0rMHg0MzgKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZm
ZmZkMzlmOTE5OGUwPl0gcHJvY2Vzc19vbmVfd29yaysweDI3Ywo+Pj4+Pj4+IMKgwqDCoMKgwqDC
oCBbPGZmZmZmZmQzOWY5MWJhZjg+XSB3b3JrZXJfdGhyZWFkKzB4MzU4Cj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgIFs8ZmZmZmZmZDM5ZjkyNDUzND5dIGt0aHJlYWQrMHgxNTAKPj4+Pj4+PiDCoMKgwqDC
oMKgwqAgWzxmZmZmZmZkMzlmODMwZTQ0Pl0gcmV0X2Zyb21fZm9yaysweDEwCj4+Pj4+Pj4KPj4+
Pj4+PiDCoMKgwqDCoMKgwqAgVGFzayBuYW1lOiBrd29ya2VyL3UzMjoywqDCoMKgIFthZmZpbml0
eTogMHhmZl0gcGlkOsKgwqDCoMKgIDkwCj4+Pj4+Pj4gdGdpZDrCoMKgwqDCoCA5MCBjcHU6IDEg
cHJpbzogMTIwIHN0YXJ0OiAweGZmZmZmZjgwYWRhZTgwNDAKPj4+Pj4+PiDCoMKgwqDCoMKgwqAg
c3RhdGU6IDB4MltEXSBleGl0X3N0YXRlOiAweDAgc3RhY2sgYmFzZTogMHhmZmZmZmZjMDgwYTE4
MDAwCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIExhc3RfZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzg5Ljg5
OTYwODYzNyBMYXN0X3NsZWVwX3RzOgo+Pj4+Pj4+IDM4OS44OTk2NjUzMDMKPj4+Pj4+PiDCoMKg
wqDCoMKgwqAgU3RhY2s6Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5d
IF9fc3dpdGNoX3RvKzB4MjE0Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZGVi
OD5dIF9fc2NoZWR1bGUrMHhhMzAKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFl
NGU4Pl0gc2NoZWR1bGUrMHg0OAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGZh
NjQ+XSBzeW5jaHJvbml6ZV9yY3VfZXhwZWRpdGVkKzB4OTI4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
IFs8ZmZmZmZmZDM5ZjlkZWViMD5dIHN5bmNocm9uaXplX3JjdVtqdF0rMHgyMzQKPj4+Pj4+PiDC
oMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmRlNWQ0Pl0gYmxrX21xX3F1aWVzY2VfdGFnc2V0W2p0
XSsweGE4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2Q5MD5dIHVmc2hjZF9k
ZXZmcmVxX3NjYWxlKzB4OTAKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwNjFjYTZj
Pl0gdWZzaGNkX2RldmZyZXFfdGFyZ2V0KzB4MjA0Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZm
ZmZmZDNhMDZkZTI0ND5dIGRldmZyZXFfc2V0X3RhcmdldCsweGI4Cj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgIFs8ZmZmZmZmZDNhMDZkZTE0Yz5dIGRldmZyZXFfdXBkYXRlX3RhcmdldFtqdF0rMHhkOAo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTA2ZGU1ZTg+XSBkZXZmcmVxX21vbml0b3Ir
MHgzOAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5MTk4ZTA+XSBwcm9jZXNzX29u
ZV93b3JrKzB4MjdjCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkxYmFmOD5dIHdv
cmtlcl90aHJlYWQrMHgzNTgKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTI0NTM0
Pl0ga3RocmVhZCsweDE1MAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4MzBlNDQ+
XSByZXRfZnJvbV9mb3JrKzB4MTAKPj4+Pj4+Pgo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBUYXNrIG5h
bWU6IGVtdWxhdGVkOzDCoMKgwqDCoMKgwqAgW2FmZmluaXR5OiAweGZmXSBwaWQ6IDUyNDUKPj4+
Pj4+PiB0Z2lkOsKgwqAgNDkyMiBjcHU6IDYgcHJpbzogMTIwIHN0YXJ0OiAweGZmZmZmZjg5ZTJl
NjAwNDAKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3RhdGU6IDB4MltEXSBleGl0X3N0YXRlOiAweDAg
c3RhY2sgYmFzZTogMHhmZmZmZmZjMGQ0MmY4MDAwCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIExhc3Rf
ZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2OTM5NTg3NyBMYXN0X3NsZWVwX3RzOgo+Pj4+Pj4+
IDM5MC4xNzg0NTk3MzEKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgU3RhY2s6Cj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZGViOD5dIF9fc2NoZWR1bGUrMHhhMzAKPj4+Pj4+PiDC
oMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlNGU4Pl0gc2NoZWR1bGUrMHg0OAo+Pj4+Pj4+IMKg
wqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWU4ZjQ+XSBpb19zY2hlZHVsZSsweDM4Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlYjExMD5dIGJsa19tcV9nZXRfdGFnKzB4MWE0Cj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZkZWRjOD5dIF9fYmxrX21xX2FsbG9jX3Jl
cXVlc3RzKzB4MzU4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlNDA5Yz5dIGJs
a19tcV9zdWJtaXRfYmlvKzB4NTBjCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZk
NGNiOD5dIF9fc3VibWl0X2Jpb1tqdF0rMHgxNjQKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZm
ZmZkMzlmZmQyZTdjPl0gc3VibWl0X2Jpb19ub2FjY3Rfbm9jaGVjaysweDE0Ywo+Pj4+Pj4+IMKg
wqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZDMzOTQ+XSBzdWJtaXRfYmlvX25vYWNjdCsweDMzMAo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZDM4MTQ+XSBzdWJtaXRfYmlvKzB4MWY0
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlMmJhOD5dIGYyZnNfc3VibWl0X3dy
aXRlX2JpbysweDg4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlNDEzYz5dIF9f
c3VibWl0X21lcmdlZF9iaW9banRdKzB4YmMKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZk
MzlmZWUzYzRjPl0gZjJmc19zdWJtaXRfcGFnZV93cml0ZSsweDQwMAo+Pj4+Pj4+IMKgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzOWZmMDRhYWM+XSBkb193cml0ZV9wYWdlKzB4MTgwCj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmYwNGNhMD5dIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSsw
eDc4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlODhkND5dIGYyZnNfZG9fd3Jp
dGVfZGF0YV9wYWdlKzB4MzkwCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlOGRm
MD5dIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDFlMAo+Pj4+Pj4+IMKgwqDCoMKgwqDC
oCBbPGZmZmZmZmQzOWZlZWEyODg+XSBmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHg4YzAKPj4+Pj4+
PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIzOTU4Pl0gZG9fd3JpdGVwYWdlcysweGQ0Cj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmJhMTUzYz5dIF9fZmlsZW1hcF9mZGF0YXdy
aXRlX3JhbmdlKzB4OTQKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIwMzcwPl0g
Z2VuZXJpY19mYWR2aXNlKzB4MWQ4Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVh
YmFhMD5dIGYyZnNfZmlsZV9mYWR2aXNlKzB4MTI0Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZmJiMDU3MD5dIF9fYXJtNjRfc3lzX2ZhZHZpc2U2NF82NCsweDcwCj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgIFs8ZmZmZmZmZDM5Zjg0N2U3Yz5dIGludm9rZV9zeXNjYWxsKzB4NTgKPj4+Pj4+
PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmODQ3ZGE0Pl0gZWwwX3N2Y19jb21tb25banRdKzB4
YjgKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmODQ3ZDE4Pl0gZG9fZWwwX3N2Yysw
eDFjCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxNGZhYz5dIGVsMF9zdmMrMHg0
MAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMTRlZjg+XSBlbDB0XzY0X3N5bmNf
aGFuZGxlcltqdF0rMHhkMAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4MTE2YTA+
XSByZXRfdG9fdXNlcltqdF0rMHgwCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFv
c2VuIEhlIDx4aWFvc2VuLmhlQG9zcy5xdWFsY29tbS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4g
wqDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgNiArKysrKysKPj4+Pj4+PiDCoMKgwqAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiBpbmRleCAzMzhkZjdhMmFlYTYuLmM4
ZTgxZjYzZmU3MyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+ICsr
KyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4gQEAgLTM1ODUsNyArMzU4NSwxMyBAQCBzdGF0aWMg
aW50IF9fZjJmc193cml0ZV9kYXRhX3BhZ2VzKHN0cnVjdAo+Pj4+Pj4+IGFkZHJlc3Nfc3BhY2Ug
Km1hcHBpbmcsCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoCDCoMKgwqDC
oMKgIGlmIChfX3Nob3VsZF9zZXJpYWxpemVfaW8oaW5vZGUsIHdiYykpIHsKPj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCFtdXRleF90cnlsb2NrKCZzYmktPndyaXRlcGFnZXMpKQo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsa19mbHVzaF9wbHVnKCgoc3RydWN0IHRhc2tfc3Ry
dWN0ICopY3VycmVudCktPnBsdWcsCj4+Pj4+Pj4gdHJ1ZSk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGVsc2UKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9sb2NrZWQ7
Cj4+Pj4+Pj4gKwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmc2Jp
LT53cml0ZXBhZ2VzKTsKPj4+Pj4+PiArc2V0X2xvY2tlZDoKPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxvY2tlZCA9IHRydWU7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4K
Pj4+Pj4KPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4KPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
