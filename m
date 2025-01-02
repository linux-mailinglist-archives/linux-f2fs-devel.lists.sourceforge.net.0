Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0679FF7D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2025 11:12:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tTIBO-0003LF-CI;
	Thu, 02 Jan 2025 10:12:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tTIBM-0003Kp-3X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 10:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=awZuLS7x7kb1byXWnsoOqp+GnJ3ZsR4Gljuu0h2nnbM=; b=Uz47Cl8Wa0F33zb3mriUYOQhm5
 2YWluvLdQmVJuIiD5qJhOKXbZe5rsQ5xEuQiIuKBetpnzRzr41VKqOJ3h49Ei8HCWxa0UKxUj9xj9
 qhLe2ZDGxyys6ebTvRqSYlvpJ9sUzWajUyhcQnooho39sH2FzpVQntL6HRU4xSBjmDis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=awZuLS7x7kb1byXWnsoOqp+GnJ3ZsR4Gljuu0h2nnbM=; b=A
 fBhDOes2GUd7xfp84FPImwKic+MRsWG12mrFi6tnEs3QjGsJq6mNT+BrdJDCc+qg/g/RuEACtlwsT
 2SYhLV0yFixjTZJmrdTu68/lN9hXrmvxGpJth/k/T1qDX1hSvd+jSa0c/RUxu4L4igW7A9jnC7hBd
 LRcAXmZj+haiCYO0=;
Received: from mail-eastasiaazon11011006.outbound.protection.outlook.com
 ([52.101.129.6] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTIBL-0007H8-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 10:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM/bdLVeRcfe5bTa32n5UISwIztg457XrPcvRO8u3VT+pMWb3E3Y6z/uigpfSf+SZ0iOOi8MaRgt04VKAFmgCeJw50dC3iFPWHs1UZLwjAsJO6P7ApLarBCXoAvVDX1xbI30ly/aZ+Z0AOQtQr7/Q18inyDAIhMsa8dyYqadwjvhR4tlc3hyvtVBnD2JgmcI7uwDOvJPVMOTv7AN+kFsFRjHVSO0FmPEnzs9ieIiKVGIun04iYDPzXvX0PbjG5C1/9TK147d2eNwQpDXJeOHIlyTA8pVuzmuXy2x3XHZHvpJFfC3HGPEITZ3SFxkIFODNKeHhFO7JYVwSCt+HGblmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awZuLS7x7kb1byXWnsoOqp+GnJ3ZsR4Gljuu0h2nnbM=;
 b=kRWbwoHU/Ds9Up2iz0GJmfOpAxTxPoXMB4RRjkML98Raxerw+HmldEdHCrXJcQlAB+KGx5HTQ1yLLOj3vvtaayFubgwmZgoSQDfe7CbPf2Z7R//tNTtqYUSZGfUOumIyMoJtP5JCKkH9tcfphmXqxDxA3hOKxzHjfPwmOTNxVJ71y0uck10BvNV2WE40CgA8fCN5ihTOXM1HT5SUegRo/jyZ4RNmq7H0hTFYYN+OtTPng1egteEaBu8xzla+h7yb0YLipEtQIP9vjC0RKLeTNKgx0dFaNKDSP27OIg+5ZneiQgUYws0zmdXiFGj2JzJbLpmi4ay9ONQaryIS9r3NSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awZuLS7x7kb1byXWnsoOqp+GnJ3ZsR4Gljuu0h2nnbM=;
 b=ZUhiBRL33jbztC+WvotO+hiraCS5SfTJVMJoaJqTCTaFOa4kf9/ziw8e8UIYy+30jK/Bb0ViEuGsmXu0S3BPj/4hTMhhLv+Rxy/owrogV7+oU65RmxylKM4UDMudJ0gc5HFjb+IZZ46OCiauekaHXiBPoJGmCkK6yyUuajnxVhGnRZTyuvNVPrTJ/ejWgFFwOLlh5zcVa22byEXw5mOl1sFJhPmZyVPz0sW/KPiIHh9h+F9WwrMRGhcgYJdTI4kZcFpDVDFQHT9GdVJzGdO3dJnSaNfjlgpzyVycsitIZLxoUO45Ml9EUJm3yJgGkgC5lZBT+Gz2vVf3ZOnaWcNJOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by KL1PR0601MB5726.apcprd06.prod.outlook.com (2603:1096:820:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.9; Thu, 2 Jan
 2025 09:55:42 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%4]) with mapi id 15.20.8314.001; Thu, 2 Jan 2025
 09:55:42 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  2 Jan 2025 03:13:08 -0700
Message-Id: <20250102101310.580277-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To TYZPR06MB7096.apcprd06.prod.outlook.com
 (2603:1096:405:b5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB7096:EE_|KL1PR0601MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: b58fa0ef-781f-4ea5-d634-08dd2b139ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7is3waDxhfxjWG6lhFaz8iEY8q8ZMRRLLqpA6hsM9YRkYWjNiBZFuKjxlr3y?=
 =?us-ascii?Q?wZkBMtek27uDWqMNW8t2rlHWwjROmDKtm0S2S5+SKvUwxM2DUqBwbbgcmv7t?=
 =?us-ascii?Q?Z1AXF0rAVPQdwkjBNs2a7h90ainbSOHn7llU0qG4N8O7AuxzzJ2uRPtbviOe?=
 =?us-ascii?Q?HX8E8okuXSprOwSYmzCuHhI6Imy5Oz5uYASChdkRQY2uteroalQcDYNAIc6j?=
 =?us-ascii?Q?lyu+wUR1OfIVuGF7bNgEX35B9FN099Gb45fsnjac75hFTCDfBn9qPUPtXATo?=
 =?us-ascii?Q?6YTsYxzZalay9FYtc+HRJuHFq9k12YEhipofyjCTd1i0suj48sQjpdAX6xnw?=
 =?us-ascii?Q?LgHtvGcRr3V/OC/dOCnU0Do1PbWznRsQIQveV7L6uq4JvsiVMlnv3ghmfBO0?=
 =?us-ascii?Q?O/CWOWRJLK0tLPR7XH2EXtj4mg4Hm8QmhoyfCWDN5gSWIc7GOuZYcAuxFL5H?=
 =?us-ascii?Q?h3S84ih8rSw/DmD9aSyuuJU9VIZwzq4SeHVk5dqH3qFGP7UbPPdjqwNCq5mt?=
 =?us-ascii?Q?oIPWH3V24+MkCuuZXx4xUO/CS0Ab4CgrKEq6LTGvQ0AKqKbYFMdI2cfs5qUj?=
 =?us-ascii?Q?J/XnyC8qzSTDbuz175eSgSo0EJOrctpXOjQcuEXORqThXQSf9Q6OoyP3hp5U?=
 =?us-ascii?Q?GXSuw2fqPPy8Fl2pDjd76bp+xJSxYISHb0CtDpcStJjdj3a432b1a1cT2Amu?=
 =?us-ascii?Q?WGILkP59MQXk/pcAXM9hqQv6Z0tr9ScBpMnz9s5WEM/IBgqn+cNKTyCipK1R?=
 =?us-ascii?Q?Sgx4eSfexv4H/B1nK1ssiwG+CgQWe0crSnVXJjMcewC9L7HFHWzaBXYmsxhg?=
 =?us-ascii?Q?HIeVBQ3eK4m+3onGMHebpwC+/jnueNJYOp66q1n+lu8UW9neL8vRHGr4/nc4?=
 =?us-ascii?Q?WwRk3dk3fPMQmd66CKIgNc4YzkFBNZ7wKPek5YMnMsJPA+knSyPsE0P6OpTH?=
 =?us-ascii?Q?oEnbRLBDAGn+gbGuYFSwpWgSLMIVgQNpA+5kEHEZ0qQjDh1b8u7lCCMRuFD/?=
 =?us-ascii?Q?bK2pfdpH9GstahJisllqK9Q2B7peDd1s2tMLi/fdhJducsj3Pn9enWPphwBf?=
 =?us-ascii?Q?n4gcGDZ1zHtD0Y9DpIfJUX3uAtQWB9D00+bsa6olbofreqg7/gFKgC4/LnBw?=
 =?us-ascii?Q?MSHTBJCLXc88gaRahGwERWy72nbdhVXbrril+Xm68gwDTgwBOXmSL+wQe46z?=
 =?us-ascii?Q?xkVMeSFOWQX5HPaXILehbwNgmx/UdqVcAnQbI0yR04sVt+ZWzCLTrJRFCzm9?=
 =?us-ascii?Q?prHPKDUzbZs+J9UO9P9yui/ysyOfotNZ76ZJsI2zYtOcN3PynZyUSeV4pLGE?=
 =?us-ascii?Q?NxDBTgz8Cd1FfS426N7S9KpUOv8sUSpp4PrEaDwWD3DCS6twA0eeS/dp5AsY?=
 =?us-ascii?Q?7yuR0C0Vd6vV7QsfSKc8gJMd/xMEI48wqquZ4zT2UOdWfoxNzP9LXorOyIrU?=
 =?us-ascii?Q?S+3PXTI4wwk1XBjH1R1xtGSRlf9HqIbf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0BqAgQ5UimnIydADRP3HyJ1ryqTbYwt4odPFTCkgoVsePJ2pInYhV65SN7Kj?=
 =?us-ascii?Q?OPklBGeE5vkLcV4XrFt+0WuFGLMvKleMQtesvAmnvcQ1Bj5soBrs1/2xsbzl?=
 =?us-ascii?Q?8pZhENp7YgOvb1hUy2SykNRqnlx2NcS6pCeR0Y+lu4I8S4F04eZkDDmTkEb0?=
 =?us-ascii?Q?qcsw4hCMlMwQhTgsbIuByB+3/eFd1Guf6qERnKn9WEowrdMPa+LMGJQUQDPT?=
 =?us-ascii?Q?d58ooj0EbKSiaNwEbqsZ2hN80i1T0V9O0ejRgZQtlKydzkNauFY26Quwxsg8?=
 =?us-ascii?Q?Olxd0kEwxkrFMeyNli0W/ycjtoCzbV/yQ3X0ukcDawteQnNy5/BJYHwadhsU?=
 =?us-ascii?Q?HXi3Q1Nbx+XZbd0YTxg1x/GWq4JObMtp4ytHgThmsUfQNsvNY5Fr/8YV5QsI?=
 =?us-ascii?Q?k8feMpdiw9o7DcmC7MLEb+XFxwdP91KOIDss3qIQOGTdHNoJ5GZ3Bl8dlR6+?=
 =?us-ascii?Q?RdSdTflqiU33JPQC2ZLJNt4GnJ2UAeZf9n51pEKcMIkkpnlqtpC6lQOz8eUk?=
 =?us-ascii?Q?/CqQeaqwlC7cbxsjUPWcr4JBtikOiE254FYuqYTwYBZYXPeNqk1eZZy/ronE?=
 =?us-ascii?Q?T4ulzuGnFFb5RIXxeKrVZx0i/rYWI08SGlBjSKwYoKO6/BwBasnyrYTOTdoS?=
 =?us-ascii?Q?VzEvrn0UHW7Eann9H5IZrHnvsGNNjc6RoN5/oxS+93K0hVKEJLllBEZ6Tyqw?=
 =?us-ascii?Q?CATjW0VCe4uES8Zx39OzokRfYiUM8BszNTz8Sk8B4zoQK8/IZF1cGO15RlQ/?=
 =?us-ascii?Q?0n2JFM5/04W41KboFQvbmtU7BT3ph/4XX9TZSHW5wpuXJp3V+dEdv2Gx7oUY?=
 =?us-ascii?Q?fwgMmSuPlSxuANUwo5rJDwsVogBQS5BT0tHNHBfiF1tvl18EGi/H2cJuqFUD?=
 =?us-ascii?Q?mzlzORSFNtJGFKIUwHI6UsnuSB7npy2ViuGwvqLBcsPM5sFxYbmz4UPcS4d8?=
 =?us-ascii?Q?7S6cScAF5GCiVhYfiFVVnrHQcce3N6d218oaGfV0AsmdvS39MeaBta4zaBk8?=
 =?us-ascii?Q?NmG/us1fhokMjD+kAbJBXGOap3bx5gxoQMeWfSajIbk1o+p8YQr52Z+ZZ4vx?=
 =?us-ascii?Q?ZTODgJsmai6P9QPJKHklc/kvaaCO6KsRQf+etORhpYClpxNHxsnJai/HY4Yj?=
 =?us-ascii?Q?JKHHBEcLQeJfSzADtLSuLVTX3FkheUmecILjX1uCzkEYNlJIOcRpmWKfyUNh?=
 =?us-ascii?Q?qjnAXXk15He0w500PbjSolBY1WU4Kn12TvwdNLWfb+5f/Li33c7mr2uSw2Sr?=
 =?us-ascii?Q?20j+rOPbq1dEHtC14VE0cZHwybkzdljAB92fkq7uHRWottwJawA97ysQbdrp?=
 =?us-ascii?Q?gldQowNHSJTEoh+m9wPRNwjtxez8rcFA8woZVMo1d7BxWeKq0U4nY2FD8xh3?=
 =?us-ascii?Q?WDmpNeUtBV5MLGU1weWtQobQ99jCsanFd1LrgGKXxIo52EPb6YmDl8sEL+NA?=
 =?us-ascii?Q?1Vohw0WznPdwPoOTD1qUO1zJTjAZowJ3Pusc4H0auuuLgUDSd+sCBLcjsL0d?=
 =?us-ascii?Q?OxRTSvindXQa8P7ntoBWTfj7lilTrohNxDZ07OJDO2vS+3B79I2+TRuvNdWe?=
 =?us-ascii?Q?6+t/LXnzYVITCWqPlak6jgOGidOghAjCSE7b4p7H?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58fa0ef-781f-4ea5-d634-08dd2b139ea3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 09:55:42.4089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqIVdMDpXyolCAe1Nlcq39tJ44TdxCuPEXwuc2z2HoBdkoqUmRBUklwOaSVUV68hn8k15H6VQKRGCIiiULJxDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5726
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fstrim may miss candidates that need to be discarded in
 fstrim, 
 as shown in the examples below. The root cause is that when cpc->reason is
 set with CP_DISCARD, add_discard_addrs() expects that ckpt_va [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.129.6 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.129.6 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.129.6 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tTIBL-0007H8-Qf
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix missing discard candidates in
 fstrim
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fstrim may miss candidates that need to be discarded in fstrim, as shown in
the examples below.
The root cause is that when cpc->reason is set with CP_DISCARD,
add_discard_addrs() expects that ckpt_valid_map and cur_valid_map have been
synced by seg_info_to_raw_sit() [1] and tries to find the candidates based
on ckpt_valid_map and discard_map. However, seg_info_to_raw_sit() does not
actually run before f2fs_exist_trim_candidates(), which results in failure.

root# cp testfile /f2fs_mountpoint

root# f2fs_io fiemap 0 1 /f2fs_mountpoint/testfile
Fiemap: offset = 0 len = 1
        logical addr.    physical addr.   length           flags
0       0000000000000000 0000000406a00000 000000003d800000 00001000

root# rm /f2fs_mountpoint/testfile

root# fstrim -v -o 0x406a00000 -l 1024M /f2fs_mountpoint -- no candidate is found
/f2fs_mountpoint: 0 B (0 bytes) trimmed

[1] Please refer to commit d7bc2484b8d4 ("f2fs: fix small discards not to
issue redundantly") for the relationship between seg_info_to_raw_sit() and
add_discard_addrs().

Fixes: 25290fa5591d ("f2fs: return fs_trim if there is no candidate")
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/segment.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index eade36c5ef13..8fe9f794b581 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2070,7 +2070,7 @@ static int f2fs_issue_discard(struct f2fs_sb_info *sbi,
 }
 
 static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
-							bool check_only)
+					bool synced, bool check_only)
 {
 	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
 	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
@@ -2098,7 +2098,7 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 
 	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
 	for (i = 0; i < entries; i++)
-		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
+		dmap[i] = synced ? ~ckpt_map[i] & ~discard_map[i] :
 				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
 
 	while (force || SM_I(sbi)->dcc_info->nr_discards <=
@@ -3275,7 +3275,7 @@ bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 
 	down_write(&SIT_I(sbi)->sentry_lock);
 	for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++) {
-		if (add_discard_addrs(sbi, cpc, true)) {
+		if (add_discard_addrs(sbi, cpc, false, true)) {
 			has_candidate = true;
 			break;
 		}
@@ -4611,7 +4611,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			/* add discard candidates */
 			if (!(cpc->reason & CP_DISCARD)) {
 				cpc->trim_start = segno;
-				add_discard_addrs(sbi, cpc, false);
+				add_discard_addrs(sbi, cpc, false, false);
 			}
 
 			if (to_journal) {
@@ -4653,7 +4653,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		__u64 trim_start = cpc->trim_start;
 
 		for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++)
-			add_discard_addrs(sbi, cpc, false);
+			add_discard_addrs(sbi, cpc, true, false);
 
 		cpc->trim_start = trim_start;
 	}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
