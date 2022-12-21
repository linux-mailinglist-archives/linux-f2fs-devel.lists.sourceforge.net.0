Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18655652C0B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 05:08:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7qP3-0004Im-Uv;
	Wed, 21 Dec 2022 04:08:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p7qOq-0004IY-2v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 04:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g5ma7J2UCGjG1EgskVNyzwgYf6tkwzMVjg3WtfklXhw=; b=bh5WQO9ykxj7Vv8V6xXunhJDBd
 IcQgNjS5DiARiBpEOqJVpc4jFA9ArxbD/eKjQ++4c1fqWXFQMaZn1wElwu6c5F/G4NdfOkoYJev1B
 ilZBcAf5cNx/AMEu1PwVuH5FwynbfdogiXZdszQVrJ3zjuDRgg024OYMRN+QTOoSjciU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g5ma7J2UCGjG1EgskVNyzwgYf6tkwzMVjg3WtfklXhw=; b=m+H5+6DiaZZ3bWL0WfXGSS4rk3
 qLm6bXO2lz9IeCLED7oXVZfXDksTrNNGMilZ5TbUoC9APwwwLZK/ba//ROHAMF20HZsqi6yvPbBS2
 URK5h/1CG2KvUt/bYPlAtC/O3/Bx1GGdMFf1BV4AOJTkniQ1p0oo7ULDOGbd/MVqOfg0=;
Received: from mail-tyzapc01on2095.outbound.protection.outlook.com
 ([40.107.117.95] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7qOg-0004Pq-F7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 04:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB/+urhxYpOxulvN+R4zs7LDvVqWAKt5s+zHT5kq/QxmS3DX5BPe+SQi/ylmsGytvB1wGs5Mt659vvqMCgao7B8Fpy+UhcfCNxS4KNBktYw639NlbRmZsua+3/Dnlzim5Ep1MmHIXF5kt1e7O4/adHIPTE38wt0IyoeZQ6ozgGTlYZiNWPM60BAXkmEzAePQ5qNLpHSVina0Aq8vONeeHdHTGHo0nneNvTJExkCq7WLkVS9GzfHA3K0rK0eqbVkluxRwKY3EqdIX3ebeZETzDxDC8Nd75As9NVqbnhtifwGCm71YFKZ/06tMm1oVJi5939eZnRbC/9O+e1Ywx2j/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5ma7J2UCGjG1EgskVNyzwgYf6tkwzMVjg3WtfklXhw=;
 b=Rsc2Jjm7sIsWwiBHGxYeFaHOAFS1y91psWhvrLw71VQVvgtjXmfm8v5fjPLHgmiNox/LeF/gHt5vqKHFEzrQGXbDm+amFHOfG4NNerSisqDcmazH5JpiYOC0zsZ69PzbSmTprdQu2oBOZlbCWWVk7zpmU7egCRxy2m0nnXSrhpNq1qFDAaITudspitELU/Rwh8TNzrBthUEAs+nvIIKixlRj1XzsH+isFgtbgo9NnDhSXCJg7Hw8iuUREDzTmJ4ooPJAcghkto4LKgw7X3kbY2Q1yokHObJTY1xc/s6oY2RTkSiq9F2dYJWbgq9v7VyR9rquNvhWtFwIdXd4wFTkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5ma7J2UCGjG1EgskVNyzwgYf6tkwzMVjg3WtfklXhw=;
 b=dCldAjJKuC4LP15NXxTIamP0CSE8pjTGr/ijcnZ+C4pEVGVQ/U5laH7z/WQWeOewk64mPqTXjrf9Oh0frIDLeCZ0KUCF6prA9Kq/XATyVu0fsqLuDTj4qgJcZz+szKJaIHpG6mOqh/+JiwpY/v+xhYW0u3nNLdELh4MHun02bM2ghDUkhFku0SjBeY7SNeg7KQiZFEzwHjyxjRcimlaEyx5GMCr0KZKkckCkhz7PD3k4VocLPQdF3oEGnIvhbq1+lZ+y/iROu0JEj06KkU5vv+Sp6vpdXmXIOn9MiYpV1S2CD7AesTjUCIU9FzBazdCRes8HpZbKo1bDGtU1PedfUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB6101.apcprd06.prod.outlook.com (2603:1096:301:115::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 04:07:55 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 04:07:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 21 Dec 2022 12:07:47 +0800
Message-Id: <20221221040747.42162-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <7cd515b7-cc24-bc66-416d-c9d27fade0ec@kernel.org>
References: <7cd515b7-cc24-bc66-416d-c9d27fade0ec@kernel.org>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7eb992-5c27-4027-37c2-08dae308efb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1uPS39rMVA1MiGua6/KdFyw1r+09QXBHjenBERWSCm9QcEARaBERkhtXc9lSJ50ECwpzDfbSdDRMV9uOMECTtNIy55BcqcKwj/OberxcSQlXv4LRNWhXTsdwfkbSnLZk+OpV+Gk4I0B+Q6i0jzU+IAaEms0Gi+RUjtqHp1ezwxDSGBIJwXscjeUS+/TWVN4m0uKR/VAcfWFDWOwyDlkGQG73u7XbOsQ9k64rye7aqoxaPri0WdaXFfHz/7VOpJ7qQjpWFX2Tjl2LDy70al+XgpqndnfqEIeE7kZgHCNaXy5izinYzhfNAXSo/bmuxlLMFyuOta6dbhz8f86VbSlNQG8gOl8pnfQItCMojfTvrbkSE/78101SqGPZVARCD6LdTjHuCsYt/5jPFTRdae2aqvOonEUzUIT2Nr0Px0z3mzfqteSJFTIDnEqLk/g1uVMfsIdb+KbPLCoAmorLnFMbLZZE6qumlGdpevdnGgVPwl/3GDxcOHMO2/PO6kXQVTsqRgL7Zn37MsluEzXuChYM9wfzvikbz33MbMYhY1V2Ox5ONP/uM5ZIDZMPJOhoREyXlE4gPanC2ncKYFlAtcrCtBIyHvXX2mqun+ZiYuH8Xw+KSyfsDYWWzMfpgx5ydksZGDNr51C1gAOg8JCwjb1Srw0Hwr6/rhgOlyxElv/0erwK1r7ObF5hmQH0omhwUy+PfU84SSqMdBWn67p8FUrjz5BlZyDQEVeWhvhXSyHeIQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(1076003)(186003)(6512007)(26005)(478600001)(966005)(52116002)(6506007)(8936002)(38350700002)(6666004)(38100700002)(6486002)(2906002)(5660300002)(36756003)(4744005)(83380400001)(316002)(2616005)(66946007)(41300700001)(66556008)(4326008)(86362001)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9T4jzhq3n3rpZEnFK037b1fyA2furSSiyeRhNnIRjuFsSRHKz1TEABj0uOP3?=
 =?us-ascii?Q?SnrrLpqAWmH8HcS5BQwjsBJQSMnTMWmHB7LhQkrm1fcyKlFvHqx9csR8Qz/c?=
 =?us-ascii?Q?UB6G2OzrVPKCzuwDyWm43kJf2GgNzB52/m0VUwVzMhC4n3hC1zRE1ssC8sVA?=
 =?us-ascii?Q?BKKnaaAGuwqNtetLFpVAamZApvUmAorDDqKHdvNxQUVD1O3qffnapEQOwgGH?=
 =?us-ascii?Q?VuLhIznecG3ETUBAAFCFjJePj/zdCJ4kUW1vUdXNRDXdtBCKZWFZP1280b6L?=
 =?us-ascii?Q?9NdB60/b9zvaH0Ph9RYQduinHbHPccsy57lrVBjGNSJxKoAVdnnxQMb86J8j?=
 =?us-ascii?Q?utKuLmXF4+7LjUUbc1xB5kkBaSIRoF3Lt1FZZzXVMtywMVFT8LkN6Jl23uWv?=
 =?us-ascii?Q?zjZrntE8VE9LdHDQ4e3NRkj09+u7F1P2F3LhZykx7d2NtW4CWRhuka7mZM+U?=
 =?us-ascii?Q?hphVQy3eenzzru9Pgfz4O3HUZ6FAxbfQCTOuZOI33FEy0ZaBBuogLoDTyt/Q?=
 =?us-ascii?Q?TmjhD7IkzmYzQB5YY2VRw/+159SdwgqEjhfSt0cq3F1qh+7W9k8zY0TCAGXB?=
 =?us-ascii?Q?DNCb5ODu/19V/0sv3Pw8/KxwE1oxtBhJz7Ftm+0lytxA/hz/lwKskNzFf0AJ?=
 =?us-ascii?Q?zkj056RyHPow9mYzWkzabijiw3YZnmV66MwaOP+JZNV9HtZnuacn90szhrot?=
 =?us-ascii?Q?FLLjOfgpFSmuRjPFbStHWu9k8zVpeIweQIS3XDhvdvHJF36W8Ze9a5eY/xS7?=
 =?us-ascii?Q?h6WOWCUccTREa32VRyTkKDAkU26/JKOJTRB37qwzETTwIL7VZo2VEqc1yej7?=
 =?us-ascii?Q?ZgI+cbssuNKTCN54vNam55WMs8AQ+HGqGUn+Sgbx8S5NG5kLDFbmUKHCfykx?=
 =?us-ascii?Q?+i6bOL1+5huxov3t2bt+2KvUU2eWchGQp088pWqrgzi7kacW0OZU4/mqyPmr?=
 =?us-ascii?Q?UpONwborLtgpJaRUhqmw4UyhIBH56WPXPThRehgXy9c0dERnWSygjnZag+mP?=
 =?us-ascii?Q?vUksCvD8B9JrnEVzjW3aBxJrjLzKsluaO2X/TumlBlwp0wYsdtv3gFncEh6N?=
 =?us-ascii?Q?rouF5tngN+2kYW++LlE7UVkaequq0KIEFNvYE+3+64wEHGq83PpEGNxdpc0l?=
 =?us-ascii?Q?dOSl8VrgL1nchDzhe3Tnz1wpsYGeE7+dHaDv0IpnSluZkzmVJvjmBVKCapP8?=
 =?us-ascii?Q?Tr1jI6yZr3iTfKOZpjQ8K/q9wBlp+VtNUWX8kOK92sETF4dlNk+PPRh9fnQH?=
 =?us-ascii?Q?wO/McgJHv6dHQIk9fuDoencnyhupc1lqznT66KABv36VTEDVN2joQojYbvct?=
 =?us-ascii?Q?Ttm8U5Tes+rOOro3lBWC/0Gx+0e48ZxULvfV2BrAsWQ9k4RhZWtx9Z4bHjCB?=
 =?us-ascii?Q?Lr2/c1bTq/K3wHKmqjK9s9hJVM0zQqs8w+NWeLpFNKQPDALcrOJ79eaf5711?=
 =?us-ascii?Q?tuZTOz04sUwX4jeldtGrSKdGaX8jsO4ZtQa85tlMkR0PayJeRfr03oADud1u?=
 =?us-ascii?Q?i9VCUoOwU3ufXuKeAHGlrYhn+H5o8RSNnbkJpQWP5Vyt1BcTuzszouThlgTE?=
 =?us-ascii?Q?LA8CvNmRLZaWublygpvK1d2TdHahDlkGiZMjgMUp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7eb992-5c27-4027-37c2-08dae308efb6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 04:07:55.0254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD8X7zUwfhL7shyFFvov6NJqc/oc/bNI33Ol5W7U+l0gDv0VKxJ5/WjNHs8ev2mx7QCvbnYqivJvQOjrOGqZpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6101
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Jaegeuk, >> This patch moves discard related code from
 segment.c into discard.c >> since discard is independent feature, and it's
 better to maintain them >> in separated place. >> >> There is no functionality
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.95 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.95 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p7qOg-0004Pq-F7
Subject: Re: [f2fs-dev] [PATCH] f2fs: maintain discard in separated file
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Jaegeuk,

>> This patch moves discard related code from segment.c into discard.c 
>> since discard is independent feature, and it's better to maintain them 
>> in separated place.
>> 
>> There is no functionality change.
> 
> Please check Jaegeuk's comments on similar patch:

> https://lore.kernel.org/linux-f2fs-devel/20180426160819.GI68594@jaegeuk-macbookpro.roam.corp.google.com/

How about to pick Chao' patch?

Discard is a relatively independent feature, maybe we can move it to an independent position.
And for systems that do not support discard, use CONFIG_F2FS_DISACRD=n to cut this part of the code?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
