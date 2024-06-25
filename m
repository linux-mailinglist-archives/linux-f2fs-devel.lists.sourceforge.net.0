Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0691674C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 14:16:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM566-0006ac-0Q;
	Tue, 25 Jun 2024 12:16:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sM564-0006aV-RG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 12:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0wf8hRRn1h4eW9UQ1E/7DSQnhcBJB9M07zLSMPHM9I=; b=cfypJCeczEUMjir53y88uwne0J
 62DsA/geKBWKYagNHWLmVsH14UcNJ1E3O994J6B3Z/46ZCvgIf3fWcdT8jdCGNSyxRlhYMackrjia
 RM341wssspiKNQW8TyV119CQC27BJOp3ghpQtEx7PDrS1Y4dG2YyGjj02g/oUF4jySPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c0wf8hRRn1h4eW9UQ1E/7DSQnhcBJB9M07zLSMPHM9I=; b=TeSBbDXA85d/mTaEURYL431wTQ
 qSR2BdWn/7H9OCCnpneVbpn0iqfpQ1+YfEzAVKz0Mdi0sh9eL3oWcx1ANOtEGL6zhHWNxYsM4DeGF
 rQjNeePAz9xhluDc7f62wND1kUcZ9ZKjejmJTmQZGtE1Q2Ei3fUNEN7mjHuFOxfAYfnk=;
Received: from mail-tyzapc01on2049.outbound.protection.outlook.com
 ([40.107.117.49] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM565-0004fe-5q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 12:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7zv0IPGQrVMIWDTbr7r7/Zr1VqJ40NubmCeMhRpIT0xRj2qlDsSlKaRWJHt/Vrb9EvFEQnqRjeAzvMYy3n6ZJ4XI34ncBg+J7Wzz3zoPiCfbMmxJS7ufixr9tnoLeDNlYhNFjHHRiUWo75Y6u7VyyfmLW1k7Gs48+bpW7LLVSb+50KXFDMJD5Lw0/WkbfdJ9OhRdIHIYR3rB2mGjPAnYS+qQKiyguw+A/w9u+aTn1NvmO8pFCSyDdfSFyW6o5QufYpz+j4cHVznEDpkz5k7bY9eQI30Y38GZrXTo9lX9CepAL6r3kqJTU0KhyabEQ536nUycfyjYmXrOAHy7G6qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0wf8hRRn1h4eW9UQ1E/7DSQnhcBJB9M07zLSMPHM9I=;
 b=Ntzga1R2SjF68rMKQntmf1/aiH+tqcmT3hle3MKG93zl2i618I4kQOpmYCBM/X5RuKNfsuQbW5Xx0Y9Q0bKPqG+FezvKg9M7ukDD5GdglglA51mVH+oROlvWG0sUN2RzLOwmmUk8ro+C4eVEDcSTAtIO6tp3EleGgnfIeXQjbQU2DQ88jo1BvhlSpvsfhhHogfyzMxCPkEClqO2lNCncZsjsmyioITPCIBdQSTIOe/bJa4xcvIuAEs1yxMQgpwhQQRB1Cv1jjNKJ7pCbHDwg7xeHRjCblhfSOVMMz/eSRuMf13CmuIG2rZcxeuK2/UlJ5aKT/S/G2rHPCyt8KDriMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0wf8hRRn1h4eW9UQ1E/7DSQnhcBJB9M07zLSMPHM9I=;
 b=flQ2BLPo9MPgL0BWmAPm1Us/IcT8sPjFJzDfztFMg+Q6pS0r98AsJnLY/dRJwGiNm0C5jBrW5XNuEBiN92WdU1NdmcQMsitZM8nnVPvv9YXKF9MdrJHMluwdy24g3Y/M4yLR8dZurOowHPXXnasJ/yeNga1flwRkV00KbgNtTYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYSPR02MB7969.apcprd02.prod.outlook.com (2603:1096:405:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 12:16:14 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Tue, 25 Jun 2024
 12:16:12 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Jun 2024 20:15:12 +0800
Message-Id: <20240625121512.3877754-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625075839.3750112-1-shengyong@oppo.com>
References: <20240625075839.3750112-1-shengyong@oppo.com>
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYSPR02MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 655df395-513c-4984-9558-08dc95109a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|52116011|1800799021|376011|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1b1KJW3I7QPdni0lQpLP1Cbv1OiCqzZWSOLRmaMx1z4HOTnTVzJyXBVhxD5s?=
 =?us-ascii?Q?CM9K5T3fkN33VbGmKM4nGRrawYPlEHAuRh62xApzYrICdybUIlA4a6HhTOam?=
 =?us-ascii?Q?wlk1vqw7RbnilraOBSSVulFaQBW3m6fCYEL3J/qTZMJNoH3haspMlGKuiaCv?=
 =?us-ascii?Q?Z3BtLgBstt8/pdVAVt1Bmk+rtDLV7t5UV7gb2KQFZxwFN9iXRRQ7nsMDKQvB?=
 =?us-ascii?Q?zZAvpEhtRSHcm0RZn1yVKfKbTNhLeFR3GRD9YndOOqPWOOnpTnCFTxVm+eOS?=
 =?us-ascii?Q?0vs+zGvQJPMJUgaD5RixjOY7RrZ/FJe5XI2v+CGMhNmD/+6urZz38dAcMq5G?=
 =?us-ascii?Q?RhfC1vWRzASxxyRWM5V+hGVjCu5L4Sf8zKc9tWRpOeROiECN/8450o41afXs?=
 =?us-ascii?Q?5GcWG6qNFlaVxlFAK3KFmC6UfM2U4aJ8mH2Efy7j1jRTNcaV84Zv7u/wfe9z?=
 =?us-ascii?Q?Y/FVuqtcM0RYj1ZQhfX2HVYdKYEJbRADBUrJJ9SzONCcVK1hrgIww4u4H5zM?=
 =?us-ascii?Q?KmL+QX7YRhyqYjhwimb2mUd8eFMCtv3BRujfnbIsF4MfpZm/ekLNouq2CV9k?=
 =?us-ascii?Q?VcP6Kd6IPFEir9hUOXEx4z/cDjeB/cj6tJ3RBMP57K50tQotjEpMyCwEBYjE?=
 =?us-ascii?Q?IaPZ+3PWaKcod23qDsFAtb99wL1X+araO1Zuq6PPpljtNBlHIRGWjHvW2f0M?=
 =?us-ascii?Q?7syKPnCvXVRgt3a+5WChHXnDpLz5lmKKrQg0HO0YlCFq+t2Ne7O6Hy06y8XY?=
 =?us-ascii?Q?i+KMNa7ONVGqyldcu9/eQRHimgaLofwuHd2neiQyvdGlO+nzxX/fBhbYG0Kt?=
 =?us-ascii?Q?pvHc5C4LGij0/OAZ772tKGSAe3dZIMQTiWpXK5lNV4hpA81foq3CUoRqRmFc?=
 =?us-ascii?Q?9VLMIK6VJaSStkIGd2qyLTWmi2ef2y41okVhgbyt2pBZ3zypc33XbZ2jWdXO?=
 =?us-ascii?Q?8FEg28C5dkNuTBuerxCovlGhseMmo7U/SoCW76iLILQdvxhhVkNK9Qkr/l1H?=
 =?us-ascii?Q?gWvJjD7qTo0n789qbqMUXZG1FamCXsC4rI+VgMT8wpKOW54fyUNW6ITiZtjU?=
 =?us-ascii?Q?9V8kZ7mkeWQ793GsoUmGrYObioDyUoKzWapirf8wYSgFlPgWXAngFw1jMScQ?=
 =?us-ascii?Q?/56uI0OA0nVShO9nCxL3xWYHoVuvhKpTXpZD0A4sXNwnN6WrKeJVgLEyNHeU?=
 =?us-ascii?Q?gE2dHmS7dImd/n+0bY2dcT+jd4r4AI0Tsb+BpPe0LwjgIPkXLIuwzTGukRbO?=
 =?us-ascii?Q?VLK8OvPLLUaS222wlqCS+Cs+CwOHdJVBs0jDOBbn129rMVKwjY+J8hoxKOUG?=
 =?us-ascii?Q?VQ5t/rMOTndP71o69c9gcQdjv/yclk3JyPosDzdG2P5/Wsp8lZBzMl1lE5yg?=
 =?us-ascii?Q?AVc5sTk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(52116011)(1800799021)(376011)(366013)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EpRVDwnFMScCnkcn0BxCnS4AFpKCvmle8uyAWZ4IvyQN3Ea0/nuhEkwMzL3?=
 =?us-ascii?Q?9l3IMlpT9hfM4rUWoJ3Cq80LxjeWuhTlO/7xJMfOleJrsOpkVpSkC6APhoPE?=
 =?us-ascii?Q?rY/asg11PuY1sATHpoTtXrcex2RWvZG0C4iheoCqjOcNjFU8MxeeWI+EGFE+?=
 =?us-ascii?Q?jOCUtcNHh98Acanpls9TR/8WuT0OHKzMVKR0hX5zkK4DqkNve3oQEGxa/uum?=
 =?us-ascii?Q?+tMsp0rPFurYZ5vn/21Kped6PnKTgNIt8Itd1eIdmgJR4E9nIzzZcH+dzag/?=
 =?us-ascii?Q?KUulzIZTn7OmIA+uNU3uzqYz0iodUaZBtoraqvHfDIU3vWSiD+Xebj1LxiRZ?=
 =?us-ascii?Q?5m2vXKV8za9rNz2eIIm87q/Mjpw8UiaJWbQKGPsRFNPMg9fyVgUWkLtDm2P3?=
 =?us-ascii?Q?xFBdSuNvA8ZirxdlNcHCN2q4u8WroqCNCaZxUdtMGI6PBltF3DlhZMTaSmba?=
 =?us-ascii?Q?eC39Ppe6WDV0A6h4NkCm2rO8JLlheCALnnQlAzKLWX+IXikSWONxA+9OEHl9?=
 =?us-ascii?Q?8kzLii67Kv/jjs2OZiVTR2KjGpkyQnZFBboJY7HbGG2WF1SMTT3CdnGM9Wk/?=
 =?us-ascii?Q?UgY7LqTFzBzeNdZUW40D6msaW5aCnmNBDqjU1UJ7Hczo5pDUWoMPEcLByhW5?=
 =?us-ascii?Q?CGg0RvtKC+AM64gHDM9Qk1919ql6ZJX/+m/pxtl0fO9XGJxUGYE8amc0qWrk?=
 =?us-ascii?Q?NpkqTHLQXfiq4PjOHu9iLLgEuoghcDuMOfdE2uUR+hvdV5ct5Mnza/dZxeAY?=
 =?us-ascii?Q?MjFqyCkBwBHl6eQa9r9yMAW7RrzwUDzWbVeq74vS0eJIuIPFMYns8GR4POG1?=
 =?us-ascii?Q?W6OyblZ9DeGQ2sUW97+y8xkRvunLhvExQbQEgxVhJpgcV2I16MVMhcpEKnu2?=
 =?us-ascii?Q?QKaf/fs26TjRSwLCI5odZRvP+/2Rprbp809a/LIG6a8OKsqc1lT1BrkpDmaK?=
 =?us-ascii?Q?jmNnnHFdwdCcRTW9Ms8wW/A7DB/LhrIOJXqGPWW4qUpTdNeA+XiEApUAE3iA?=
 =?us-ascii?Q?DP5kEYUzxS8bDzYOWJ51vPdNoFk3Mt4rWrElaOcZPHDc5027/HCawGaSgqu4?=
 =?us-ascii?Q?nxihhnb2WJQoq7XIPARHIW6dErAJMfsW+Nmyy82g9PxPNz/unEWX9z4TlkJi?=
 =?us-ascii?Q?gf8p6edpOV2mFf7m6m7icDS1TIJSn0wE4VKBSqsfZ7KFlu/pfvqZHCeAI3VW?=
 =?us-ascii?Q?2fxxiJtBdZ2rrygE1bbXL2BN3LPOpxbzwvUrq8kV28kEW9ae5BFqO8U7gW9f?=
 =?us-ascii?Q?U18+VSveIjX09z18+up7n3ubKCopJCm7N4a6PJ8xDDwSg8TMT0DcD0OotFyq?=
 =?us-ascii?Q?GDV9aKrnnn8GDmaNg0Lyy3ojRc52piT4A4V0s8EiseFdyfsw7APpu87mQ2F0?=
 =?us-ascii?Q?lpnC4YCLkLrKcdykdc0fclnRa1MkV3EtlDCvkM6DwWyqroAU9LdtO5g2NiYv?=
 =?us-ascii?Q?CVFwIFjsbvx60LF2l5mFAZYgWj3pJqZJasC9dRGSgf2W7/vS2PTjGe/jktF9?=
 =?us-ascii?Q?qcGO9DeAz7Ydmi/2NqZm5sHWyJ3/dtzGKxidV+KUwn7K1fXMwAwD9mALI5Jk?=
 =?us-ascii?Q?Z2Ca6P9AGFJx6q6W2TPMa7aYKQT15JjuSQfXdE3v?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655df395-513c-4984-9558-08dc95109a23
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 12:16:11.9837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqQIO/Al7ZUsKPrQ+DH4Uv/RMr0GNUAs6jHBQ43EjCXD0hjPHN9uYig2+/Z7qGUO0YeZ+PB8F0btQ1AQCFjuEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7969
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When new_curseg() is allocating a new segment,
 if mode=fragment:xxx
 is switched on in large section scenario, __get_next_segno() will select
 the next segno randomly in the range of [0, maxsegno] in or [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.49 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.49 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sM565-0004fe-5q
Subject: [f2fs-dev] [PATCH v2] f2fs: only fragment segment in the same
 section
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When new_curseg() is allocating a new segment, if mode=fragment:xxx is
switched on in large section scenario, __get_next_segno() will select
the next segno randomly in the range of [0, maxsegno] in order to
fragment segments.

If the candidate segno is free, get_new_segment() will use it directly
as the new segment.

However, if the section of the candidate is not empty, and some other
segments have already been used, and have a different type (e.g NODE)
with the candidate (e.g DATA), GC will complain inconsistent segment
type later.

This could be reproduced by the following steps:

  dd if=/dev/zero of=test.img bs=1M count=10240
  mkfs.f2fs -s 128 test.img
  mount -t f2fs test.img /mnt -o mode=fragment:block
  echo 1 > /sys/fs/f2fs/loop0/max_fragment_chunk
  echo 512 > /sys/fs/f2fs/loop0/max_fragment_hole
  dd if=/dev/zero of=/mnt/testfile bs=4K count=100
  umount /mnt

  F2FS-fs (loop0): Inconsistent segment (4377) type [0, 1] in SSA and SIT

In order to allow simulating segment fragmentation in large section
scenario, this patch reduces the candidate range:
 * if curseg is the last segment in the section, return curseg->segno
   to make get_new_segment() itself find the next free segment.
 * if curseg is in the middle of the secion, select candicate randomly in
   the range of [curseg + 1, last_seg_in_the_same_section] to keep type
   consistent.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v2: update commit msg
---
 fs/f2fs/segment.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0ce3d080f80a..55d474f5c2103 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2782,10 +2782,21 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned short seg_type = curseg->seg_type;
+	unsigned int hint;
 
 	sanity_check_seg_type(sbi, seg_type);
-	if (f2fs_need_rand_seg(sbi))
-		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
+	if (f2fs_need_rand_seg(sbi)) {
+		if (__is_large_section(sbi)) {
+			hint = GET_SEC_FROM_SEG(sbi, curseg->segno);
+			if (GET_SEC_FROM_SEG(sbi, curseg->segno + 1) != hint)
+				return curseg->segno;
+			return get_random_u32_inclusive(curseg->segno + 1,
+					GET_SEG_FROM_SEC(sbi, hint + 1) - 1);
+		} else {
+			return get_random_u32_below(MAIN_SECS(sbi) *
+						SEGS_PER_SEC(sbi));
+		}
+	}
 
 	if (__is_large_section(sbi))
 		return curseg->segno;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
