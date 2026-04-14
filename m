Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN2TBz7l3WnDkwkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 08:57:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DAC3F64C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 08:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnWdZyQLP34oZtZFUuNBw3i6/sI2Ze8PnYeE80HPhrg=; b=Iicl/hygUXPOjehUojdzP0gLm4
	L+0x1VzF5Nc0ynHlBmC7A5IcRomjGkqaCv0BFaN0AqTFLiIhSwA6Bp1yzSWkETQToFpSjFSp6Q+H5
	fde4OFE2qFUhGF3e1HJ2dCRkE+1ko+sTKpB6EnoqNZ2b2UKHDwBF+WcDCoG/tKF9PjsU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCXhb-0006Hi-3J;
	Tue, 14 Apr 2026 06:56:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosen.he@oss.qualcomm.com>) id 1wCXhZ-0006HZ-4M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Apr 2026 06:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gpp9e+IoF4ecCLIojCShojXR2hRYgoNe23FKAsQznSs=; b=KfgD+N4CH5X+I0ZxXL4v/Ghnv/
 D4RHnaiCSPL7uF4fe1Cr1UaFJ50qFF1bDskFaueGseRudUjTaXqg9Yv1//6ThvJ/LNF3bWupJljFk
 aKhxms/5miFwfIRZXsbuq3QsL5GFsWzndKRtY5R+bCtM8K3CJ4npgazGChLELYvhITE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gpp9e+IoF4ecCLIojCShojXR2hRYgoNe23FKAsQznSs=; b=Lh9YOO1QGkloNSWVEzy5xu7p7t
 T0eEHcioHfAcsbaOhlkCJvY3fjvebV6vicrWiKvQ/FcvycbU4NriUB7cQiaXCgX2fF3GSBb4ud5YI
 38n93fgskq4orrm9CR158ixbbgCVKcYTnZftEEoOzxY/ftzAitxkLz0TAC1BV+LxQGk8=;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCXhY-0006pr-AG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Apr 2026 06:56:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63E6XZ3f280857
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 14 Apr 2026 06:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gpp9e+IoF4ecCLIojCShojXR2hRYgoNe23FKAsQznSs=; b=PxNwXq8V9y+A+cUD
 i9GC8jOIvKVaacMefPAB4ezeXHghG/YNp1k4GE0FG2l9/fsY0spzWmjmoDv4jwQh
 945jACfzHhrZ1PBiJkObzFi/ygI7Z4EF5kKA1I3/n+LVO6SAwHgsQ2azddgs0clT
 Db48krIigq0q7JyqZ2fHKw2pyjaUkFQlzsIvXLkWqFzaAeap52jkNZ7bJgN4QaaH
 1I2i+0ugzfknMOq1sxvYuwXmpE2921U5fj1RqHrYDjcqP6mRtF8s/H9axWQBNQpG
 qcqMzeN8MrVwVT/ZEUpO34Qn9a4Qge62Tus2VfpIGFhdzqRD1cm9rFykq93morBD
 bUOONA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vhead-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Apr 2026 06:56:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-82ce0a9e558so3845678b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 23:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776149796; x=1776754596;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gpp9e+IoF4ecCLIojCShojXR2hRYgoNe23FKAsQznSs=;
 b=JBu1GBmuPS5F6Hrg7MFk790N/3ZHYx79ax5IgwEoMY8R+m/j6aZ5Xo4zCJyzr+BMCJ
 2JgMKN8pmNowyOPL0IArkopSwClPx4tmFMsxEUz3jJlZiGMAe2bWrSYxYOBQQwEJ8AFJ
 dIdaaUrMykai5l1AlU6E5MS9eAvV2M+KWhF7zXpb6yZkkrffz8Ap6leKzKJPkMhRoCO8
 ozvsB8vzxVOPJ2lXwoXF+t8Wym3O+OAcRnLMErW9KqESyM0acoKqF/ufw3sxBKTujhWt
 yWByFbaNYeqB4v5zh2SZn2OcbDhVUT+QAsZTMlZpHIrrWcr4SiyDWn/fFfAQNAWFf+xz
 ZzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776149796; x=1776754596;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gpp9e+IoF4ecCLIojCShojXR2hRYgoNe23FKAsQznSs=;
 b=bAN//Seww1dm1jkfBrx2HMcrgCkklFfYvEaJLi9K9D+P6WTMvpmF4mMnrasM44QBuD
 vRyPH59tTnD1BKmceS/d7xOuou3lFRTmVj4S8OdJP2Il9VmOTyrTQFvvRfg4SmbG4d17
 cgOuZs92FYPeIFQgVeNTYiG98hnUKoftDslZN8NIy8kUgttDigE29CtpGzI6NbS5Mimb
 3MUzIvCDXQYAf2b5dDJpIZ6UhoNvH+OpRWPeQUadoG+jdcNus37DatoJfSiGWsSg0TsD
 72l+zK/zzP1aK5d7SR8uu9gxcDyFexh3Yd7UA/Ola4fibZLeihleQ68LokpEUVQfxDjA
 vEfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8sFcYy5KxuwuK/rJdk3g5PSiGMLACwJyMTgaPC8Uj8CHpEl0bZli+aw+bjCx9zSzJImfbnysdN/HL6HUQeYmiY@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxAJz8bWkxr7YQUu6ZDY2GkERZv960C+y+aAd9tlU8vxhBfPTJ7
 u79QkgF2L8Fpu7MNqN0iQbaNxdK+HA1j7VCk3Q6qPX0DucCNt/F63Zc9/4DNPqh8d/sjsOiX5sd
 o1UrTTJHT4cbl9nmZT1zGbjVUXlsj/TrO618g2dXqFsT98kVrK/88aGcAIKWEzAiAthdIEEfhga
 uPzJaq
X-Gm-Gg: AeBDieuBQSBhPD/ddRR4XegnvmNjlPUmgX4UGum8NpwIoDxFBIyuMY63n3hcpBuBBCH
 Rj+vn1dcPXr6jmHWWrHd/WlopGSSHDelvQXqdOlf1Dt+uqKk6YeVLEpOclk7doQwfUvHq7AQLUk
 rd2UBIY+NsswwBgLmgauVd6dDs6toRctpNfPxhSv4FFa95PXtFxgBDBXTSbYPsuZBgSF+0omhn8
 9Hc0zmAxbUkXfLwqQPSglbsy1yBe84hrl55Om15qySa0nOZLpNA6Ohg/pkn396hjpRDroS1pYX3
 /6gjvPDN1JF2qBgtJK9R/EdFQ9oO2UNUBkhlpXpJgam4RdzLynoK+MOXBODxE+8eB1LxHdMGwDR
 mSUABhuf1sDtUzKMUtSGmvg1KlpksoUFSZejSgMTJOigAJh3wSkOdsWOtVzf7OnjxCpTBdf5gI7
 7G908DhUsf9AefD81S1XiJnlc14A==
X-Received: by 2002:a05:6a00:2e06:b0:82f:4b03:71c4 with SMTP id
 d2e1a72fcca58-82f4b037976mr4534385b3a.18.1776149796126; 
 Mon, 13 Apr 2026 23:56:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e06:b0:82f:4b03:71c4 with SMTP id
 d2e1a72fcca58-82f4b037976mr4534361b3a.18.1776149795555; 
 Mon, 13 Apr 2026 23:56:35 -0700 (PDT)
Received: from [10.249.31.220] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f0c507a2csm14608091b3a.53.2026.04.13.23.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 23:56:35 -0700 (PDT)
Message-ID: <765aa6b4-a77e-473e-98a2-bcb41eddeb51@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 14:56:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
 <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
 <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
 <90f3c071-9567-476f-aa27-866cd5310776@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <90f3c071-9567-476f-aa27-866cd5310776@oss.qualcomm.com>
X-Proofpoint-GUID: e0S6ARbRI7uLuQmf3uUWC5ueh4JiRwSa
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69dde525 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=FP58Ms26AAAA:8 a=EUspDBNiAAAA:8 a=CKNY2_WVayThvPQi1pYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: e0S6ARbRI7uLuQmf3uUWC5ueh4JiRwSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MyBTYWx0ZWRfX+87P3zGP9rfD
 Qyp0S2PFMHIpJVS7KxMvKtr8EV+VHhuTIQuPja+grYtzj7LCtnSnxUwWV0h5oks2whjUDNAOX6/
 snD4nmn/JSzld1dDmpkuHWJoSxbOXrDV5fHzHMmqV10my1AKdnceVpLpT+4Fr4EDkBo9SI2KqgG
 VUQR8y/j5bkDdYradLDbSBodzVXgYRUEi2Om6gAri/9cmOp/pbopMOHykq2lP+uy6/rPuh/Srpc
 akegLxKvze+fApnZD6UBoBdpWhJfdt+cTyH1+xWzf4DrcyoWsfwWGhJDVHOtp3BqlhStdaHwqnr
 xyXhvYhE5kGY0o7Wa5dQSXvn5aTwbfUGm+hDOVDiazIm4oQTw2MPzAFhJs89WwcSmk/E8AJ0gSz
 ScxO+9Wokq0XeIRwAF9t+D9sD3Zg3WLiRfwmO5BZBSzGDC0samfi5Wsn8DT+/27Sc436iP3Rgf8
 FmrrpSrhKM6hP7OpgGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140063
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/13/2026 10:42 PM, Xiaosen via Linux-f2fs-devel wrote:
 > > On 4/13/2026 7:54 PM, Chao Yu wrote: >> On 4/10/2026 6:53 PM, Xiaosen
 He wrote: >>> kworker/u32:7(f2fs writeback thread) was trying to a [...] 
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
X-Headers-End: 1wCXhY-0006pr-AG
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
Cc: can.guo@oss.qualcomm.com, Xiaosen He <xiaosen.he@oss.qualcomm.com>
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,m:xiaosen.he@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qualcomm.com:-,oss.qualcomm.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	HAS_REPLYTO(0.00)[xiaosen.he@oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05DAC3F64C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMTMvMjAyNiAxMDo0MiBQTSwgWGlhb3NlbiB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90
ZToKPgo+IE9uIDQvMTMvMjAyNiA3OjU0IFBNLCBDaGFvIFl1IHdyb3RlOgo+PiBPbiA0LzEwLzIw
MjYgNjo1MyBQTSwgWGlhb3NlbiBIZSB3cm90ZToKPj4+IGt3b3JrZXIvdTMyOjcoZjJmcyB3cml0
ZWJhY2sgdGhyZWFkKSB3YXMgdHJ5aW5nIHRvIGFjcXVpcmUKPj4+IHNiaS0+d3JpdGVwYWdlcywg
dGhlIG11dGV4IHdhcyBhbHJlYWR5IGFjcXVpcmVkIGJ5IGVtdWxhdGVkOzAuCj4+PiBrd29ya2Vy
L3UzMjo3IHRyaWVkIHRvIGZsdXNoIHBsdWdnZWQgSU8gYmVmb3JlIHNsZWVwLCBkdXJpbmcKPj4+
IGZsdXNoaW5nIHBsdWcgbGlzdCwga3dvcmtlci91MzI6NyBnb3QgcHJlZW1wdGVkIGluIFJDVSBy
ZWFkLXNpZGUKPj4+IGNyaXRpY2FsIHNlY3Rpb24gYW5kIGdvdCBzY2hlZHVsZWQgb3V0IHdhaXRp
bmcgdG8gYmUgd29rZW4gdXAgYnkKPj4+IHRoZSByZWxlYXNlIG9mIG11dGV4LiBlbXVsYXRlZDsw
IHdhcyBibG9ja2VkIG9uIGJsa19tcV9nZXRfdGFnCj4+PiBhcyB0aGVyZSB3YXMgbm8gYXZhaWxh
YmxlIHRhZyBhbmQgZXhwZWN0ZWQgdGhlIHByZXZpb3VzIElPCj4+PiByZXF1ZXN0cyB0byBiZSBo
YW5kbGVkIGJ5IFVGUyBob3N0IHRvIHJlbGVhc2UgdGFncywgYnV0IFVGUyBob3N0Cj4+PiB3YXMg
YmxvY2tlZCBvbiBzeW5jaHJvbml6ZV9yY3Ugd2FpdGluZyBmb3IgZW5kaW5nIG9mIFJDVSBncmFj
ZQo+Pj4gcGVyaW9kLiB0aGUgZGVhZGxvY2sgd2FzIGNhdXNlZCBieSB3cml0ZWJhY2sgdGhyZWFk
IHdhcyBzdHVjayBpbgo+Pj4gUkNVIGNyaXRpY2FsIHNlY3Rpb24gd2FpdGluZyBmb3IgbXV0ZXgu
IGNhbGwgYmxrX2ZsdXNoX3BsdWcoKSBpZgo+Pj4gbXV0ZXhfdHJ5bG9jaygmc2JpLT53cml0ZXBh
Z2VzKSBmYWlsZWQsIHNvIHRoYXQgdGhlIHBsdWcgbGlzdCBpcwo+Pj4gZW1wdHkgd2hlbiBibGtf
Zmx1c2hfcGx1ZygpIGlzIGNhbGxlZCBpbiBzY2hlZF9zdWJtaXRfd29yayB0bwo+Pj4gZml4IHRo
ZSBkZWFkbG9jay4KPj4KPj4gSU1PLCBsb29rIG1vcmUgbGlrZSBhIGNvbW1vbiBidWc/IG90aGVy
d2lzZSwgc291bmRzIGxpa2Ugd2UgY2FuIG5vdAo+PiBncmFiIG11dGV4IGxvY2sgdy8gbXV0ZXhf
bG9jayBkaXJlY3RseSBkdXJpbmcgd3JpdGViYWNrIGluIC53cml0ZXBhZ2VzPwo+PgpJbiB3cml0
ZWJhY2sgdGhyZWFkLCB0aGUgY2FsbCBwYXRoIHdvdWxkIGJlIGFzIGZvbGxvd3MuCmJsa19zdGFy
dF9wbHVnCm11dGV4X2xvY2sKd3JpdGViYWNrIGZpbGUgQQptdXRleF91bmxvY2sKbXV0ZXh0X2xv
Y2sKd3JpdGViYWNrIGZpbGUgQgptdXRleF91bmxvY2sKLi4uLi4uCmJsa19maW5pc2hfcGx1ZwoK
U28sIG1vc3QgcHJvYmFibHkgd2hlbiB0aGUgdGhyZWFkIGZhaWxlZCB0byBhY3F1aXJlIHRoZSBt
dXRleCBmb3Igd3JpdGluZyBiYWNrIGEKZmlsZSdzIGRhdGEsIHRoZSBibG9jayBwbHVnIGxpc3Qg
aXMgbm90IGVtcHR5IGFzIHRoZSBwcmV2aW91c2x5IGhhbmRsZWQgZmlsZXMnCmRhdGHCoCBoYXZl
IGJlZW4gcHJlcGFyZWQgYXMgd3JpdGUgcmVxdWVzdHMgYW5kIHBsdWdnZWQgb24gdGhlIGxpc3Qu
Cj4+Pgo+Pj4gwqDCoMKgwqAgVGFzayBuYW1lOiBrd29ya2VyL3UzMjo3wqDCoMKgIFthZmZpbml0
eTogMHhmZl0gcGlkOsKgwqDCoCAyMzMgdGdpZDrCoMKgwqAgMjMzIGNwdTogNiBwcmlvOiA5OCBz
dGFydDogMHhmZmZmZmY4MDk5MzkwMDQwCj4+PiDCoMKgwqDCoCBzdGF0ZTogMHgyW0RdIGV4aXRf
c3RhdGU6IDB4MCBzdGFjayBiYXNlOiAweGZmZmZmZmMwODNjNDgwMDAKPj4+IMKgwqDCoMKgIExh
c3RfZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2OTM5NTg3NyBMYXN0X3NsZWVwX3RzOiAzODku
NzU2NjM5NTc0Cj4+PiDCoMKgwqDCoCBTdGFjazoKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIx
ZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWRlYjg+
XSBfX3NjaGVkdWxlKzB4YTMwCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWU3NTQ+XSBwcmVl
bXB0X3NjaGVkdWxlX25vdHJhY2UrMHg2OAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmOWRkZjM4
Pl0gcmN1X2lzX3dhdGNoaW5nW2p0XSsweDVjCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5OTk1
Yjg+XSBsb2NrX2FjcXVpcmUrMHg2OAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmU4NzBjPl0g
cmN1X2xvY2tfYWNxdWlyZSsweDM0Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTg3NjQ+XSBw
ZXJjcHVfcmVmX3B1dF9tYW55KzB4MjAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlM2E2ND5d
IGJsa19tcV9kaXNwYXRjaF9saXN0KzB4NTcwCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTMy
NjQ+XSBibGtfbXFfZmx1c2hfcGx1Z19saXN0KzB4MTNjCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZmZDQzYTg+XSBfX2Jsa19mbHVzaF9wbHVnKzB4MTFjCj4+Cj4+IEl0IHRyaWVzIHRvIGZsdXNo
IHBsdWcgbGlzdCBpbnNpZGUgbXV0ZXhfbG9jaygpIGFuZCB0aGVuIGJlIGJsb2NrZWQuIFdpbGwg
aXQgY2F1c2UKPj4gdGhlIHNhbWUgaXNzdWUgdy8geW91ciBiZWxvdyBpbXBsZW1lbnRhdGlvbjoK
Pj4KPj4gaWYgKCFtdXRleF90cnlsb2NrKCZzYmktPndyaXRlcGFnZXMpKQo+PiDCoMKgwqDCoGJs
a19mbHVzaF9wbHVnKCgoc3RydWN0IHRhc2tfc3RydWN0ICopY3VycmVudCktPnBsdWcsIHRydWUp
OyA8LS0tIGhlcmUKPgo+IElmIGJsa19mbHVzaF9wbHVnIGlzIGNhbGxlZCBoZXJlLCB3aGVuIHBy
ZWVtcHRpb24gaGFwcGVuZWQgaW4gUkNVIGNyaXRpY2FsCj4KPiBzZWNpdG9uLCB0aGUgdGFzayB3
b3VsZCBiZSBzY2hlZHVsZWQgb3V0IGluIFIgc3RhdGUsIHNvIHRoYXQgdGhlIHRhc2sgY2FuIGJl
Cj4KPiBzY2hlZHVsZWQgaW4gcXVpY2tseSB0byBlbmQgUkNVIGdyYWNlIHBlcmlvZCwgdGhlbiBp
dCB3b24ndCBibG9jayBVRlMgaG9zdC4KPgo+IFJlZ2FyZHMsCj4KPiBYaWFvc2VuCj4KPj4gLi4u
Cj4+IG11dGV4X2xvY2soJnNiaS0+d3JpdGVwYWdlcyk7Cj4+Cj4+IExldCBtZSBrbm93IGlmIEkn
bSBtaXNzaW5nIGFueXRoaW5nLgo+Pgo+PiBUaGFua3MsCmt3b3JrZXIvdTMyOjIgKHdyaXRlYmFj
ayB0aHJlYWQpCl9fbXV0ZXhfbG9ja19jb21tb24KIMKgIHNldF9jdXJyZW50X3N0YXRlKFRBU0tf
VU5JTlRFUlJVUFRJQkxFKTsKIMKgIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQKIMKgIMKgIHNj
aGVkdWxlCiDCoCDCoCDCoCBzY2hlZF9zdWJtaXRfd29yawogwqAgwqAgwqAgwqAgYmxrX2ZsdXNo
X3BsdWcKIMKgIMKgIMKgIMKgIMKgIF9fYmxrX2ZsdXNoX3BsdWcKIMKgIMKgIMKgIMKgIMKgIMKg
IGJsa19tcV9mbHVzaF9wbHVnX2xpc3QKIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJsa19tcV9kaXNw
YXRjaF9saXN0CiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwZXJjcHVfcmVmX3B1dAogwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcGVyY3B1X3JlZl9wdXRfbWFueQogwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmN1X3JlYWRfbG9jawogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcHJlZW1wdF9zY2hlZHVsZV9ub3RyYWNlCgpJbiBfX211dGV4X2xvY2tfc2xvd3BhdGgs
IHRoZSB0YXNrJ3Mgc3RhdGUgaXMgc2V0IHRvIFRBU0tfVU5JTlRFUlJVUFRJQkxFLCB0aGVuCmNh
bGwgYmxrX2ZsdXNoX3BsdWcgbGF0ZXIsIHNvIG9uY2UgcHJlZW1wdGlvbiBoYXBwZW5lZCBpbiBS
Q1UgY3JpdGljYWwgc2VjdGlvbiwKdGhlIHRhc2sgd291bGQgYmUgc3R1Y2sgaW4gUkNVIGNyaXRp
Y2FsIHNlY3Rpb24gd2FpdGluZyBmb3IgdGhlIHJlbGVhc2Ugb2YgbXV0ZXguClJlZ2FyZGluZyBt
eSBmaXgsIGluIG11dGV4X3RyeWxvY2ssIGl0IHdvbid0IGNhbGwgYmxrX2ZsdXNoX3BsdWcgaWYg
bXV0ZXhfdHJ5bG9jawpmYWlsZWQuIExldCdzIGZsdXNoIHBsdWcgbGlzdCBpZiBtdXRleF90cnls
b2NrIGZhaWxlZCwgc28gdGhhdCB3aGVuIGl0IGdvZXMgdG8KbXV0ZXhfbG9jayBhbmQgZmFpbGVk
IHRvIGFjcXVpcmUgdGhlIG11dGV4LCB0aGUgbGF0ZXIgY2FsbCB0byBibGtfZmx1c2hfcGx1Zwp3
b3VsZCBiZSBzaW1wbGUgYXMgdGhlIHBsdWcgbGlzdCBpcyBlbXB0eSBhbmQgdGhlcmUgaXMgbm8g
Y2hhbmNlIHRvIGdvIHRvCnJjdV9yZWFkX2xvY2suCgpSZWdhcmRzLApYaWFvc2VuCj4+Cj4+PiDC
oMKgwqDCoCBbPGZmZmZmZmQzOWY5M2U2YzQ+XSBzY2hlZF9zdWJtaXRfd29yaysweDc4Cj4+PiDC
oMKgwqDCoCBbPGZmZmZmZmQzYTBiMWU0ZDg+XSBzY2hlZHVsZSsweDM4Cj4+PiDCoMKgwqDCoCBb
PGZmZmZmZmQzYTBiMWU1YzQ+XSBzY2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkKzB4MTgKPj4+IMKg
wqDCoMKgIFs8ZmZmZmZmZDNhMGIyMGM3Yz5dIF9fbXV0ZXhfbG9ja19jb21tb24rMHhhYjgKPj4+
IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIyMDA4ND5dIG11dGV4X2xvY2tfbmVzdGVkKzB4MmMKPj4+
IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlYTcyYz5dIGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweGQ2
NAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIzOTU4Pl0gZG9fd3JpdGVwYWdlcysweGQ0Cj4+
PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZkMDlmZDg+XSBfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUr
MHg3OAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5OTU4Pl0gd3JpdGViYWNrX3NiX2lub2Rl
cysweDJiOAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5Y2MwPl0gX193cml0ZWJhY2tfaW5v
ZGVzX3diKzB4YTAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmQwOTA1ND5dIHdiX3dyaXRlYmFj
aysweDE4OAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA2NmQwPl0gd2Jfd29ya2ZuW2p0XSsw
eDQzOAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTE5OGUwPl0gcHJvY2Vzc19vbmVfd29yaysw
eDI3Ywo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTFiYWY4Pl0gd29ya2VyX3RocmVhZCsweDM1
OAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTI0NTM0Pl0ga3RocmVhZCsweDE1MAo+Pj4gwqDC
oMKgwqAgWzxmZmZmZmZkMzlmODMwZTQ0Pl0gcmV0X2Zyb21fZm9yaysweDEwCj4+Pgo+Pj4gwqDC
oMKgwqAgVGFzayBuYW1lOiBrd29ya2VyL3UzMjoywqDCoMKgIFthZmZpbml0eTogMHhmZl0gcGlk
OsKgwqDCoMKgIDkwIHRnaWQ6wqDCoMKgwqAgOTAgY3B1OiAxIHByaW86IDEyMCBzdGFydDogMHhm
ZmZmZmY4MGFkYWU4MDQwCj4+PiDCoMKgwqDCoCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6IDB4
MCBzdGFjayBiYXNlOiAweGZmZmZmZmMwODBhMTgwMDAKPj4+IMKgwqDCoMKgIExhc3RfZW5xdWV1
ZWRfdHM6wqDCoMKgwqAgMzg5Ljg5OTYwODYzNyBMYXN0X3NsZWVwX3RzOiAzODkuODk5NjY1MzAz
Cj4+PiDCoMKgwqDCoCBTdGFjazoKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9f
c3dpdGNoX3RvKzB4MjE0Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWRlYjg+XSBfX3NjaGVk
dWxlKzB4YTMwCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWU0ZTg+XSBzY2hlZHVsZSsweDQ4
Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGZhNjQ+XSBzeW5jaHJvbml6ZV9yY3VfZXhwZWRp
dGVkKzB4OTI4Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGVlYjA+XSBzeW5jaHJvbml6ZV9y
Y3VbanRdKzB4MjM0Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZGU1ZDQ+XSBibGtfbXFfcXVp
ZXNjZV90YWdzZXRbanRdKzB4YTgKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2Q5MD5dIHVm
c2hjZF9kZXZmcmVxX3NjYWxlKzB4OTAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2E2Yz5d
IHVmc2hjZF9kZXZmcmVxX3RhcmdldCsweDIwNAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwNmRl
MjQ0Pl0gZGV2ZnJlcV9zZXRfdGFyZ2V0KzB4YjgKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDZk
ZTE0Yz5dIGRldmZyZXFfdXBkYXRlX3RhcmdldFtqdF0rMHhkOAo+Pj4gwqDCoMKgwqAgWzxmZmZm
ZmZkM2EwNmRlNWU4Pl0gZGV2ZnJlcV9tb25pdG9yKzB4MzgKPj4+IMKgwqDCoMKgIFs8ZmZmZmZm
ZDM5ZjkxOThlMD5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2MKPj4+IMKgwqDCoMKgIFs8ZmZmZmZm
ZDM5ZjkxYmFmOD5dIHdvcmtlcl90aHJlYWQrMHgzNTgKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5
ZjkyNDUzND5dIGt0aHJlYWQrMHgxNTAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjgzMGU0ND5d
IHJldF9mcm9tX2ZvcmsrMHgxMAo+Pj4KPj4+IMKgwqDCoMKgIFRhc2sgbmFtZTogZW11bGF0ZWQ7
MMKgwqDCoMKgwqDCoCBbYWZmaW5pdHk6IDB4ZmZdIHBpZDrCoMKgIDUyNDUgdGdpZDrCoMKgIDQ5
MjIgY3B1OiA2IHByaW86IDEyMCBzdGFydDogMHhmZmZmZmY4OWUyZTYwMDQwCj4+PiDCoMKgwqDC
oCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6IDB4MCBzdGFjayBiYXNlOiAweGZmZmZmZmMwZDQy
ZjgwMDAKPj4+IMKgwqDCoMKgIExhc3RfZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2OTM5NTg3
NyBMYXN0X3NsZWVwX3RzOiAzOTAuMTc4NDU5NzMxCj4+PiDCoMKgwqDCoCBTdGFjazoKPj4+IMKg
wqDCoMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+PiDCoMKgwqDC
oCBbPGZmZmZmZmQzYTBiMWRlYjg+XSBfX3NjaGVkdWxlKzB4YTMwCj4+PiDCoMKgwqDCoCBbPGZm
ZmZmZmQzYTBiMWU0ZTg+XSBzY2hlZHVsZSsweDQ4Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzYTBi
MWU4ZjQ+XSBpb19zY2hlZHVsZSsweDM4Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZWIxMTA+
XSBibGtfbXFfZ2V0X3RhZysweDFhNAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmRlZGM4Pl0g
X19ibGtfbXFfYWxsb2NfcmVxdWVzdHMrMHgzNTgKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZl
NDA5Yz5dIGJsa19tcV9zdWJtaXRfYmlvKzB4NTBjCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZm
ZDRjYjg+XSBfX3N1Ym1pdF9iaW9banRdKzB4MTY0Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZm
ZDJlN2M+XSBzdWJtaXRfYmlvX25vYWNjdF9ub2NoZWNrKzB4MTRjCj4+PiDCoMKgwqDCoCBbPGZm
ZmZmZmQzOWZmZDMzOTQ+XSBzdWJtaXRfYmlvX25vYWNjdCsweDMzMAo+Pj4gwqDCoMKgwqAgWzxm
ZmZmZmZkMzlmZmQzODE0Pl0gc3VibWl0X2JpbysweDFmNAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZk
MzlmZWUyYmE4Pl0gZjJmc19zdWJtaXRfd3JpdGVfYmlvKzB4ODgKPj4+IMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZmVlNDEzYz5dIF9fc3VibWl0X21lcmdlZF9iaW9banRdKzB4YmMKPj4+IMKgwqDCoMKg
IFs8ZmZmZmZmZDM5ZmVlM2M0Yz5dIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUrMHg0MDAKPj4+IMKg
wqDCoMKgIFs8ZmZmZmZmZDM5ZmYwNGFhYz5dIGRvX3dyaXRlX3BhZ2UrMHgxODAKPj4+IMKgwqDC
oMKgIFs8ZmZmZmZmZDM5ZmYwNGNhMD5dIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSsweDc4Cj4+
PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTg4ZDQ+XSBmMmZzX2RvX3dyaXRlX2RhdGFfcGFnZSsw
eDM5MAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWU4ZGYwPl0gZjJmc193cml0ZV9zaW5nbGVf
ZGF0YV9wYWdlKzB4MWUwCj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZWEyODg+XSBmMmZzX3dy
aXRlX2RhdGFfcGFnZXMrMHg4YzAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmJiMzk1OD5dIGRv
X3dyaXRlcGFnZXMrMHhkNAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmExNTNjPl0gX19maWxl
bWFwX2ZkYXRhd3JpdGVfcmFuZ2UrMHg5NAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIwMzcw
Pl0gZ2VuZXJpY19mYWR2aXNlKzB4MWQ4Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlYWJhYTA+
XSBmMmZzX2ZpbGVfZmFkdmlzZSsweDEyNAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkMzlmYmIwNTcw
Pl0gX19hcm02NF9zeXNfZmFkdmlzZTY0XzY0KzB4NzAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5
Zjg0N2U3Yz5dIGludm9rZV9zeXNjYWxsKzB4NTgKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5Zjg0
N2RhND5dIGVsMF9zdmNfY29tbW9uW2p0XSsweGI4Cj4+PiDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4
NDdkMTg+XSBkb19lbDBfc3ZjKzB4MWMKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxNGZhYz5d
IGVsMF9zdmMrMHg0MAo+Pj4gwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjE0ZWY4Pl0gZWwwdF82NF9z
eW5jX2hhbmRsZXJbanRdKzB4ZDAKPj4+IMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjgxMTZhMD5dIHJl
dF90b191c2VyW2p0XSsweDAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvc2VuIEhlIDx4aWFv
c2VuLmhlQG9zcy5xdWFsY29tbS5jb20+Cj4+PiAtLS0KPj4+IMKgIGZzL2YyZnMvZGF0YS5jIHwg
NiArKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gaW5kZXggMzM4
ZGY3YTJhZWE2Li5jOGU4MWY2M2ZlNzMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+
Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBAIC0zNTg1LDcgKzM1ODUsMTMgQEAgc3RhdGlj
IGludCBfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGlu
ZywKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gwqAgwqDCoMKgwqDCoCBpZiAoX19zaG91bGRfc2VyaWFs
aXplX2lvKGlub2RlLCB3YmMpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFtdXRleF90cnls
b2NrKCZzYmktPndyaXRlcGFnZXMpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrX2Zs
dXNoX3BsdWcoKChzdHJ1Y3QgdGFza19zdHJ1Y3QgKiljdXJyZW50KS0+cGx1ZywgdHJ1ZSk7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBz
ZXRfbG9ja2VkOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJnNiaS0+
d3JpdGVwYWdlcyk7Cj4+PiArc2V0X2xvY2tlZDoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsb2Nr
ZWQgPSB0cnVlOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
