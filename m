Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB45O7bT2GmuiwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 12:40:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7883D5BEA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 12:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fX71YFprENwtH2ZfTv9Ds/4tSJnUkFEfkSgY8LCRCk=; b=HirFmFYOZr/95U3TViv85tGwhv
	bt0I/j/zn+FbGJurFacnAz+itg6uARoUCdiJtpv7mDFf2jt4+LPFLtkussuRc0Ouiw0b5GarUckv6
	RRuj1FDJD6i+PrhQNro7jNarGHh9nJN/ekzdjX9sNm/DoZjrkeWchL3NhNQWfH+xYFgU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wB9I9-0007E1-T4;
	Fri, 10 Apr 2026 10:40:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiaosenh@qualcomm.com>) id 1wB9I8-0007Do-DY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 10:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dN0blfGCNG8iFgGwX2uj84V8ihLKaHdvsUC/7wRLJNs=; b=drnqIndjhJ9aAFLA2ptnE6XDe8
 AZbDpIArUPedN2E79gMgWb2OtJvU82ibkr01/Neu1KHmrxiXK9CAGoqpGTQdqKhyqIx0wAljp349a
 0fKydMWPyrNW/Edg9fffCTniaIWcbry17Mq1GUoM66tCq2DjcEjPz3qHAgDERPT5b3Uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dN0blfGCNG8iFgGwX2uj84V8ihLKaHdvsUC/7wRLJNs=; b=W
 VumrwTOMtrMobkdP3kZloDfb4S+QT6y47GUy2+sdM7VaoyN+11zTc9ifMEzrliUvznyOicCqcr6I8
 WUb0NcIK9Vkdev3/GGPv8rwjxTB75GAc6oVvnalrTyQTaEebYNu3DNDd3G1CW4NSDnkpYR1wuEstP
 UoLCa3xSQExB8XlU=;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wB9I8-0003tF-9E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 10:40:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63A5oIut1925143; Fri, 10 Apr 2026 10:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=dN0blfGCNG8iFgGwX2uj84V8ihLKaHdvsUC
 /7wRLJNs=; b=COfJcjSzfb8yG2kYsaCqG2yqriRWcDEw7ewijvoa5F0xgcQOtfj
 eXLXLJ9knNvtFVvvxkEz5Mvl8ETKq9m7wUiVGpvI336ksRD2lcjF4Xd3DKAf8hrH
 1R03EdjSfnjuLQY7JEZlug8qSY7J6ue9+cb9eBWqpGXn0Em8xy2J/PNvwtjbk6jG
 qTI7D0VxscZO4rtERfNFzaMkpmrsXrQcdlDZJ4Nt/gRuCfTyqm6yeEiqZUqlmgKj
 PoaHcsCreXUGi/f7GIh1ISDeafR4DpBG3e2zgtYuTUFpxWwXPM1Oqp8p8cjwUGDV
 sIfbJUdYLpoVz/nqZ4DzO866RwEDSy5B84Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjryyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2026 10:19:58 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63AAJvG1029354; 
 Fri, 10 Apr 2026 10:19:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ddpkefvxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2026 10:19:57 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63AAJv9a029320;
 Fri, 10 Apr 2026 10:19:57 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-xiaosenh-lv.qualcomm.com
 [10.81.27.218])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 63AAJvbM029318
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2026 10:19:57 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4148646)
 id B95CA6E4; Fri, 10 Apr 2026 03:19:56 -0700 (PDT)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Apr 2026 03:19:51 -0700
Message-Id: <20260410101952.3210031-1-xiaosen.he@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8cece cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uXHHtLGvMqj8PqssxhUA:9
X-Proofpoint-GUID: _11oMlZz-EAK4xDp67cfmIFhJUZ_5HS4
X-Proofpoint-ORIG-GUID: _11oMlZz-EAK4xDp67cfmIFhJUZ_5HS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NSBTYWx0ZWRfX7xBmIZe084qu
 01GLLmtbh+0uGxPwQS7+R2Nr5EgsH2+Lx9HB8H8gzv2bfLRbF1yvBfaWaJvl+WUlN8nVfkdcXMl
 Juf9vAXoMuklVXRp0NryzMGilrzdTtu+zFJ/ztw2cVm8kzscJig2ORokgZ+ozgwxKdriAb7sbHb
 Myvfsb3G/RrkED/IUpKmiz9VophwWPi6oZJczP+uR05NA0cMEO17wgMP+HeEHgPNKzHEl+XVAJv
 Na54+Ln/2Uq19qWhq25P5nQPw+q4imUY7XxY8teuST7QxD4B8b0c7PUtdkCDElbfaq/V3oOxIvi
 /v/p745DOYpBRqVkQKcyFRMY830DrVeAu7WP8s3y9sY0vvArQjEvq8CRII1p6LUroYwd0qd65wz
 UUU1S0+VoocHCKJFq44zqyGm9qk10gcLBKw8PRMp9cklu38KLnSjOlhO/IR80Ty2MfcJPX8WnhH
 B0WlagV/omhPpvRa1ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100095
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Change in v2: call blk_flush_plug() if
 mutex_trylock(&sbi->writepages)
 failed, so that the plug list is empty when blk_flush_plug() is called in
 sched_submit_work to fix the deadlock. Link to
 v1:https://lore.kernel.org/linux-f2fs-devel/20260407100341.3319002-1-xiaosen.he@oss.qualcomm.com/T/#u
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wB9I8-0003tF-9E
Subject: [f2fs-dev] [PATCH v2 0/1] f2fs: fix deadlock in serializing io
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
Cc: can.guo@oss.qualcomm.com, xiaosen.he@oss.qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,m:xiaosen.he@oss.qualcomm.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,qualcomm.com:s=qcppdkim1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,qualcomm.com:-];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[xiaosen.he@oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4B7883D5BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change in v2:
call blk_flush_plug() if mutex_trylock(&sbi->writepages) failed,
so that the plug list is empty when blk_flush_plug() is called in 
sched_submit_work to fix the deadlock.

Link to v1:https://lore.kernel.org/linux-f2fs-devel/20260407100341.3319002-1-xiaosen.he@oss.qualcomm.com/T/#u

Xiaosen He (1):
  f2fs: fix deadlock in serializing io

 fs/f2fs/data.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
