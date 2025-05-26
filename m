Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8371AC3AD6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 09:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iGsNn5d22szVzvzKTC97yoy71HiXV0HM0u9MTriOTYc=; b=YombW+3hkL210gsWWCW43Y2kSF
	xD4ngTQUQ5D3Bn7/WXExpfHBym/ii/zTb13R/E6cIbQ7F2q+EHoZe8+Rup9lAU65xLgjjcZunTVIR
	uAXc8Ww8F+gjbFtowBLcymyY68fslGckEBNVrGm/kK1xMrtly8qcfqeCYZkisH9ulMhA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJSV8-0001oZ-Lo;
	Mon, 26 May 2025 07:44:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uJSV7-0001oG-3N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 07:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFAHJg85Dxy3eu8ydJAOWlMj/X8t8JTVqtn8Xzv/hxU=; b=WhzLMl0V5ISaF2OC0trXgbhwXw
 I4Szx30v7X7/VQReNVFjTWpYy25SL6kF/xSiCAdg5Xg0EPml7ftU+1YhllKXvkuiKTUfPRG953ny+
 /MxyV56TLfrXWusZmUDzFpirw0RPFgeYTegxexZEIJyAMhfzgPc5IliendwCFLjhsxd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zFAHJg85Dxy3eu8ydJAOWlMj/X8t8JTVqtn8Xzv/hxU=; b=M
 MMhYTy9s0jGPE6LMAObA6OzPHNlSe7M/RYIIY4xSELWmtVf0vWGs67Q2F7Bzaar5ByI0tGJTqnsgm
 CRmnuWX0gVX2miVzrJvP9KKUF6EO6bPXR4b473g0X/YpFhwBJJE9PWf/jU7kTxpgBiZooZ6ImRFIB
 ovJ9eAvycoYB+/ac=;
Received: from mail-japanwestazon11012071.outbound.protection.outlook.com
 ([40.107.75.71] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uJSV6-0001R8-1s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 07:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9GFCawQmAdX7eS/RnUDaWNKqMn4hpdFc3P4GBpX3qDBPAoQQCbqfsFMJgjUFFu3ygAcV9tYF7XndTQdlnT8gW2ehJE5czuARhmp0GGk5J2k95F/OaqqHeKjaPIvocARcAeugDJelCcepyT+zEC8FcqtdzxyL4h18l0CCevvAYoVMgwbMTLT1dNQrgjcwrNB5GEqnzktM8uVxHzv0UNVl9hV/uBOrSze+nPnplAnZO32wK+lO6q19bnPXMoszrGNSVdHVlV41Op6Y2gtAM/OSqF8wENg7jI0lVF/GKgWgKxiSkD+vaTeSAQxA2Sxa17DFt/bJ3TOyGSvdAZZYhhjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFAHJg85Dxy3eu8ydJAOWlMj/X8t8JTVqtn8Xzv/hxU=;
 b=SiXqlYNiZ+BO/X9YR1vfIGnmq3GefC0vs+YXQKAMFSdB9KI3oizD/EZuglRZw6ZuJNKazDErnoqv5ToLQKL/b8jQmoPP8+uLuIV+NLZpa/HMZqsZO+KHcsAyZ53pcD3MqW+SbX+QnsKLgiNwGcchcORrQtz08xtEVDdVjI2zuWEn6BernXIB8ypBQr0cCJ1Lt8Pr0G6lKn/neIKi0FIX6EYAGazHn0z6PchfVmngvSHnZu6O8YkWC0AvuF57vHzkJ+DDCcLfSWatbxZzBM9qyYy+VdvjS+7C/nkn8TXYmGvRPidYiZnUsFEABOZ93OU55ry+JULIlMEHt4rabDKqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFAHJg85Dxy3eu8ydJAOWlMj/X8t8JTVqtn8Xzv/hxU=;
 b=VWOkKnae5h2A3KKbalaxkSGUun6rrQ17HP9IGTUpGg/eHukUmgR5GT3IIas1uEuVj4V4Sa8bK7VxieFgAymMNLUiaj1WBmk1YNu5s/2ONzTM/JK0q8Zpdsq/sUC/LWRnen7w7s6zTkC3qEcG60+SvFJvsgboiu3eanDNwyVcSdjCtWezcCj92FmsF6R227HweRXN3e6LvdOALuJIOWsFxcJY86lETSsPr4IchkIRAAqdl8jqrHIhfuDd9RFqlxWPhhduEGndWoXndwLGqhHeI/fAaE8T/fHAEPbo7B9NWYD593IR15mEukDHH+XmVKdNiIMrgbojDP+YADl5tqubmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by KL1PR0601MB5629.apcprd06.prod.outlook.com (2603:1096:820:c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 07:43:51 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::a57c:8e30:d8a3:54f1]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::a57c:8e30:d8a3:54f1%3]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 07:43:51 +0000
To: zlang@kernel.org,
	fstests@vger.kernel.org
Date: Mon, 26 May 2025 02:03:23 -0600
Message-Id: <20250526080323.1851300-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To PS1PPF5540628D6.apcprd06.prod.outlook.com
 (2603:1096:308::24e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF5540628D6:EE_|KL1PR0601MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 4630ad33-9199-4345-c2b5-08dd9c290ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uVgbjYqX/snd5bYuefULsezsU4UnTXWgNy7KP/xmDuUD6hqH+oDcAKOH4yWx?=
 =?us-ascii?Q?6ziFdiTXQz8yVchHKQysoDxCZ6okIIQpdFtPIJzgL+RpsqQDN9OBecj7XKgi?=
 =?us-ascii?Q?JZ6AzcK9vaFeecRrGDKOc0HGc7nIuBuo20Tn88UcM2EbZOl4dhIxRw+vuNu0?=
 =?us-ascii?Q?4bujgvkMgUCdGFoc+cADDwy1uPBgc9r/ad30pMgHd+cE1muZDSuhPXemsOZe?=
 =?us-ascii?Q?IfmwFO6QFx6cECJ7hZZreinp2AmenViUBTUdT+PccoRxDutez/gE7I0SuXh6?=
 =?us-ascii?Q?Lzdv68U3Uhitx+nJ6dAh3E9CQ+/qo9SirxILQFIQ7FbswNo8d3M40jqEsYrN?=
 =?us-ascii?Q?cfhznnLZMmBIWslTlry/hAxiyHbmd1eCIvfN55NfWpGZCSs6wRHkLOHBfp4Y?=
 =?us-ascii?Q?3GgPCEKKBq+SqgKo5Xi4ddN8HIdmTAE5cTfWqdHd4tKDp6m8AAuAaQCISf3+?=
 =?us-ascii?Q?1sk3gQAOB7UGgWRpfuSI19GT4ufbP/qStqlLELDbu2X5gh9X+m9SwXDw+YX8?=
 =?us-ascii?Q?Ap+FbAp11fIf2SeMU7oArOrxtNTKIvLjNTmrgVpaS8W2EObbeUrprFQZuUSj?=
 =?us-ascii?Q?RXN2H9chruVCt6F6RLdUBQk/Rj8koT9W2wbsUtrniRozqi/IIQwWxZnHaajC?=
 =?us-ascii?Q?+96XHUGYcQ2fQbptcpo6WwGSVdiYZPapQF7i8bTEHGwao8of16PE3tFtQUXS?=
 =?us-ascii?Q?+IFLxGmFim5K+ZWNXTqLOTcd9flxW9QtG9OCmZJ7fJeIR/wnwKT/dtWU6HZX?=
 =?us-ascii?Q?U/eYM42IM8uIYDWQq7QySrK8sg8hu4CT6lLkfLNKIfVlv5ioaqVVMoR+ZdFj?=
 =?us-ascii?Q?EGP0uiva1N1v1RKtEe1/kpkZw1NgyX1Eo5l1neFr/FWWPx1AsQ6Jj1+y0Nv2?=
 =?us-ascii?Q?p2Fkw9trILLEqYWnQZqZUh5raFhjXZAL+/ueDX0bsKnCFmJ+6ZHk8BRfDcnx?=
 =?us-ascii?Q?7DAlUeCIxENwpTIVQnMKa8bujfLG3NH3QVuKWTw3kEyPQGFgey31amzVPDNn?=
 =?us-ascii?Q?26fY2/Brq4lzyEenKFPagM/rfjsN0lcEplN6+4Pkh1JOno17YBrHazqpQF3M?=
 =?us-ascii?Q?6wpem36mxpWy5b0uX9f1nn51iW+hvX/vuoUY71wAfKt019WYclgKjyByBXd9?=
 =?us-ascii?Q?S/HBuweHSZvXl2ye14TSPkKgo45AOJ1EQ8lgiWLOGKi0JSNSChxinkKw8Zbm?=
 =?us-ascii?Q?UCVdM/5/iBzqKKJd5sSGvroYcEMconJfGoxNvx6hbZhjSeEhiHi1XDNr1/JL?=
 =?us-ascii?Q?MaiYQoZF/nq7tctLXh386H8JdL9XHBwK8t0ZdfKtOTLSFLmcI8J7oEdNg4Xz?=
 =?us-ascii?Q?j11oJOcua1YYkltbGZZ7iqIY7ELHrE9Of9BZ3QROl3/ahdePZdqfCRUbIkkE?=
 =?us-ascii?Q?JBcwaLnMDssP+UMr/hZffSWn+h06NEy8xfltWNJPOgZ/DYz1XDKZmVNsuCXg?=
 =?us-ascii?Q?xsy/BNLSFqbVRgoXqIytxWHvcqnBKhxd7lxEaXSTijvVq0aGrkWjew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6VzvLIqqjc3/rBMZHL6w9izBc0k7e/Taq6DsYm4PsVbEHbE5o28DL75dV8gb?=
 =?us-ascii?Q?BqXS/dgAtuEcqkHu9h7aee8V3FCZtcSnjnYLpQwOYNegmeQs3SH6yPuXDdLN?=
 =?us-ascii?Q?XMifcf3O8jcDDsJqVbwzhDqj3wCj968CTUepwUYCO5PgXHPDlGzWUCbXsqdc?=
 =?us-ascii?Q?OoIgB9yWCJ+8LP6kGjYKPQWnSLP3npFWiNbloK3rmk8B2gm+ntTa7k2/TNts?=
 =?us-ascii?Q?IRuQLWwS/TCAAmSLiv6vdkOLL4kGu8+mRYijDp7K4wvp+2hEvoSm0cmDxcle?=
 =?us-ascii?Q?SbphmPBfJIDqa/8TULL76Joe9go+55NP/0yY+JHcni0p0HccaCJtOrACHBI4?=
 =?us-ascii?Q?HQ+FWKO2sOrRYA9KNjnJ9ZLvTUDtKoiX7et8flgo2Sz11dMps4wBAxJmO7mb?=
 =?us-ascii?Q?5v1JJPIPUSRMQ4LxCZI57VAAp9xzWg+hNEzZ3fTJp6Tpn6dyKCjr5YODfk0m?=
 =?us-ascii?Q?vNBOmlzovdvVvUvg5RGktIID2AABBNY4PXPi0wSMZ+wkiJq9LwjvFZr6tiML?=
 =?us-ascii?Q?AJGqQ6NaRwppEABcHMjk85wBXlRpOcaq9S8R9Pbiqh1AmELswdyWBV2vSyYy?=
 =?us-ascii?Q?4nXxFNR2+0JfMFrMEU8JT6l3ir33O4bkh4ln/z5JSXoo8dZF2f9+sQtPnHze?=
 =?us-ascii?Q?xiD1Od8PXPij2AzmJUpg5ibaMeF6dDuk/66Oj4CWzDoZSLvGWh/IX2CDu+86?=
 =?us-ascii?Q?MHiCXq2erllE3p+C8i19KgpcdF6QuZADEG/1LbmJd1WfTbcECaI90KQlYtJ0?=
 =?us-ascii?Q?otFZ7mV6UJDqHrgPv+UgK+nX03GDrmu4BZl6yx+wPZHkUFi//PFnYNvyowPE?=
 =?us-ascii?Q?qvIneYSpXjShfA1nr75LLtMKy/RZ7wCGr0cAvFEkP18n1xvFYu/ZQxlaisSk?=
 =?us-ascii?Q?r5umllKF5ldlTFv4ZNuOHnd9/QBkvJV63UaSomGiwbLLjbbW0tqAAoK+Klom?=
 =?us-ascii?Q?XplYhMNnVs26c020xVwefUxDzyyf+HgW0NrUzcgd04evVXbwhvSqaxuVRfCd?=
 =?us-ascii?Q?0k27ee9yxC/QGUhfCnwPg8/RCfuSXbSqOQ3l2yBHneP4XGiXQJLZHJTYdGj+?=
 =?us-ascii?Q?IrOok8AokuXgBu8D51mGtsYHhv/5E208sjWUyca5YseLiDpCgRcEiyrFVWkd?=
 =?us-ascii?Q?joOTCj3rJKqBH27hbeq93jaNOGMMyHd01RIFsEokH6LXZ1eo4fDqGMLO77jw?=
 =?us-ascii?Q?SSgJv3X9Uus1NiKqNnwd2omkfXhsQeU6fTCTjX/C+FNP7sV/wKx7VB7Qd1Ew?=
 =?us-ascii?Q?kojZI3qlQkVtfywcREAKJ21pjqq3lAiz28ftIvae9dZU2s/QR3/7tlgVEXbS?=
 =?us-ascii?Q?2rQkoqBCGtVlzmKVOimng0w27l19GyKDX+ksI+oLTFr3D86eouAxN2XabQfj?=
 =?us-ascii?Q?ZAehsyhArT7HrfVbcdjs6yR2gKcfIC7E4KjopnKROTEa9/CHV5EAe+gbUwyf?=
 =?us-ascii?Q?iNi/E2X98hOIwD3JhuvY2HMxTfhxCGsvswfDSj/7/BJqGXw60Q02C6K9RAXv?=
 =?us-ascii?Q?lNkmq3jMqtlIMxj4f/M0DCzvap3zfmu3yRtKPGQPuhlZb4bN+G/SIEE09B1t?=
 =?us-ascii?Q?RvFCDEVM9dBxKAp+JkILo7IlKt47aQXBQw0Hhjli?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4630ad33-9199-4345-c2b5-08dd9c290ee2
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:43:51.6005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdwX/RDwD1brU7i1vd+9wot0dBplbO8huv6OJ2xvYYLOGjii6ClyP73dYk2nhbj/aczCo/3nqSN5NOvJB7WD2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5629
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test case to verify whether the
 CP_TRIMMED_FLAG
 is properly set after performing the following steps: 1. mount the f2fs
 filesystem
 2. create a file, write data to it, then delete [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.75.71 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.75.71 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.75.71 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uJSV6-0001R8-1s
Subject: [f2fs-dev] [PATCH v3] f2fs/014: test for missing 'trimmed' flag
 issue
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
Cc: jaegeuk@kernel.org, Chunhai Guo <guochunhai@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test case to verify whether the CP_TRIMMED_FLAG is
properly set after performing the following steps:
1. mount the f2fs filesystem
2. create a file, write data to it, then delete the file
3. unmount the filesystem
4. verify that the 'trimmed' flag is set in the checkpoint state

We should apply the commit ("f2fs: fix missing discard for active
segments") to resolve the issue where the 'trimmed' flag is missing.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v3:
  - change the Copyright to VIVO
  - add this case to the "trim" test group
  - no need to check pwrite, as it is always present
v2:
  - Skip this test case if discard is not supported.
  - Renumber this test case from 012 to 014.
v1:
  https://lore.kernel.org/linux-f2fs-devel/20250521064952.1373690-1-guochunhai@vivo.com/
---
 tests/f2fs/014     | 40 ++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/014.out |  2 ++
 2 files changed, 42 insertions(+)
 create mode 100755 tests/f2fs/014
 create mode 100644 tests/f2fs/014.out

diff --git a/tests/f2fs/014 b/tests/f2fs/014
new file mode 100755
index 000000000000..2f2e4dc360d9
--- /dev/null
+++ b/tests/f2fs/014
@@ -0,0 +1,40 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 VIVO.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/014
+#
+# This is a regression test case to verify whether the CP_TRIMMED_FLAG is
+# properly set after performing the following steps:
+# 1. mount the f2fs filesystem
+# 2. create a file, write data to it, then delete the file
+# 3. unmount the filesystem
+# 4. verify that the 'trimmed' flag is set in the checkpoint state
+# We should apply the commit ("f2fs: fix missing discard for active
+# segments") to resolve the issue where the 'trimmed' flag is missing.
+#
+. ./common/preamble
+_begin_fstest auto quick trim
+
+_fixed_by_kernel_commit 21263d035ff2 \
+	"f2fs: fix missing discard for active segments"
+
+_require_scratch
+_require_command "$DUMP_F2FS_PROG" dump.f2fs
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+_require_batched_discard $SCRATCH_MNT
+
+foo=$SCRATCH_MNT/foo
+$XFS_IO_PROG -c "pwrite 0 1m" -c "fsync" -f $foo >> $seqres.full
+sync
+
+rm $foo
+_scratch_unmount >> $seqres.full 2>&1
+
+$DUMP_F2FS_PROG $SCRATCH_DEV | grep "checkpoint state" | grep -o trimmed
+
+status=0
+exit
diff --git a/tests/f2fs/014.out b/tests/f2fs/014.out
new file mode 100644
index 000000000000..cb0c9447d675
--- /dev/null
+++ b/tests/f2fs/014.out
@@ -0,0 +1,2 @@
+QA output created by 014
+trimmed
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
