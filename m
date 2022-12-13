Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0264B50A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 13:21:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p54I1-0004gD-Iv;
	Tue, 13 Dec 2022 12:21:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p54I0-0004g5-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 12:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+BZuOFAwDWgF383bZFGqI+tx8jwBwqp+fhaLHiltM+M=; b=eej/LE5sZ0yrFK4kn/h/OoEBBa
 QwK+cbToOQGrV8j6ctRA0ffG5CgWGE44Oy2DxUDTVqeb5J1WsV1LgHmKy24ogFEsuB8OTd2LfgiEo
 a2E4N+m/V1UPl+PQRyP8qV8NLz1Y5ySsDrrMXJNF+a0GFwVDQY8GETSgMMUeMuPgI1y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+BZuOFAwDWgF383bZFGqI+tx8jwBwqp+fhaLHiltM+M=; b=fiOxXUpJU5vUnVv6iKeFW7Odor
 xYqlPyc/9z6V+P/Y0YRlL5tueabaLOhNTj0gf75Li5snqV9reHaFsduvX41LNOypggL4/tZibaUy7
 OPssASveG1Fq0o+B/0OW7GHjYzwK5ci4feqU3xGPDj1BGOcehbVK5HOhMt1GqBloZaXo=;
Received: from mail-tyzapc01on2100.outbound.protection.outlook.com
 ([40.107.117.100] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p54Hy-00Fkiz-Ow for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 12:21:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feaVyU4e6EbIgGVB67WvIgkRrRPnf8IvtGlc8zjA6LR3DM09+sWxc1rOIe9bvqqSroh76ycbBM4EVnVbjIKJMGydDeaJWMFqbiqVeX2g5kWOtu2AC7agB6OS7NdbQxltH9u3BJgCPg+UubJdftoTYIkGtazOq8sTJo84QWymsjpi1RAdnE31rD3QUWTH+OZOZMTvhzJq4YHChlTL/irFLM3qG7uKlhSz9ZX0n9/7hLBcBNO3QV4ElgPhwkEMSVh1HmoRh5EvmFvqnUZfc/oU7m9+nvi6UZlOF4q62MXEf5I8XlgVieo8Z3Pl1ApU/PajGJFXpuexnZkSQ4mvB9zHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BZuOFAwDWgF383bZFGqI+tx8jwBwqp+fhaLHiltM+M=;
 b=QYyqGrNNIk85g26qnnJVOS3RpaUTUFmSjKvT5VsRYE7qTaMGo609eFqwWEjlZsivRuBQfpkvIV6h3WvTbAWQiqGvPUXNZ7/4cc7H2noYa+r+md+k7nI8zuo5AVD7tH56vOxBeJjmNWBl6dGphjU7DLYoNfdPch+MWlarVxoK0XCZz3WsqsGql85bA0G3hIJsVZhB49osqC1kRDlfMw3DLLV6lFvMAyVEhQiGFhqJ//tuXUBMzLDYteMrW6lMtFCURwIVuY1nSn/kcHSHna+wkndXWiGOL8EUMVgIVWblIWb+2aka17btJpUxZ640exqMz4TASygXBdj3t4JeLNXKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BZuOFAwDWgF383bZFGqI+tx8jwBwqp+fhaLHiltM+M=;
 b=YqKCh98Qo7SSgy4ATgbu6sid9vNMFpQJegS8YE+TSICrFl1kca5fqA7b7wFHagZT/UvEOgIOC+w3HNuFkb2r4GesHWNYK6m2I517Qhr/YXU96TM2eyz8HO45kIW6ZzW8ttvdGrrRtDvjCiL418nVh0qmLupYZ0nsshk7w19CJ/NvQ+OBOFiHRGt6MS9ZIJV9yTwRVwwhTZdzfItQzinQ2tVGEwoxQW1aipR4EaIg82vNMiFPSjcBws/WLODCNJeu58q05qi6XVv6w+0poa8MMUMlZrWhWCB+3Et9Yd8Eg3a8q0BiMDawdl3TKTlv5xW/44xhkZDN3ys9HWPZUutszw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5245.apcprd06.prod.outlook.com (2603:1096:101:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 12:21:29 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 12:21:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 13 Dec 2022 20:21:21 +0800
Message-Id: <20221213122121.18685-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <0cc89bf7-ea7c-d6e9-5ba9-548181de4c82@kernel.org>
References: <0cc89bf7-ea7c-d6e9-5ba9-548181de4c82@kernel.org>
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: f112fc51-fc0d-49b8-486e-08dadd049016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APSqAgdxebMa/2qMF5L4jP7UPREZFNy9VpTFsSeK3YLsGs9QeTfT5LxxwMgVjmc/eikaPv12RsPhY9U+HRykLdjpyQNRlM6+7QhjZWaAnypRsHmBOd3IN0wDlI419gOfuk4z5g0y/XemtZq3Mn4ILZEISoHdaIkDQbISRi/9wvVhSP5EP4nWZX3098uDGLAEk3RGkZVcLImlm/HcIvk3iZFRKWkwcX8DkYOoWIkTP5WSAaEJL6HCJ3NMQGAr/P1OioFUNt5vepP3lnOqDyAmtFZrTczDJnl4ZDxnOJGtde7O1EaM1WWwAZr1SVT/WXYvCsQRxLRA5w9OtnHgEXw463GT6lm0lHypNY3Rnl6243tZxcINLR90QTYAJlvPCAz5UZX6l9WkXiYB4lsjkToY5dLVy6L6ePJiiW85IJObzRapTBDFsxorlx7Dlt+trIz2rSS+PRrBnGjBf3xhkHGthQ5TeQGqJNrnJPkPUnZd3D+sCFyNA/Cjg6TRIf0NZiSFW9rfmvM4EYaUHXneqwAL0PxmqIyk96nU4QB4Rtxxo715mo+aaAsc8gcyGqDYok8vFk/Z0S3TS1e5/7UI1R1YXhpa8Vy9/4If5wGOYSIAhmudg3AFt0gpBTixEDtHib7dTytO4K5uFNEB4Rf+WfYyWEHBuclKjLLJ97mdmAytJQnswVTUCDw2/8BCgTIQvRbi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(86362001)(6486002)(316002)(83380400001)(26005)(186003)(52116002)(6506007)(6512007)(2616005)(1076003)(2906002)(41300700001)(4744005)(8936002)(5660300002)(8676002)(66476007)(4326008)(38100700002)(38350700002)(66946007)(66556008)(478600001)(36756003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H8a/rSQG3F2cn2T/BR20dYHmyIVbaTIwijA1OY64kKgl+NqgPZXU3o27czZw?=
 =?us-ascii?Q?SFyPfYwLrE3JMMdOXsoW3/zG9OC2qkBxATjXf2sJHiwYWrn9LUhHkiSoS6s5?=
 =?us-ascii?Q?L+nB7+Tbm4yrJat9k9ylFlgTB8WJ9fKEjRg7hVP1RMWyhb0xTgnxUt/qrS+E?=
 =?us-ascii?Q?ZLJAOHdNyQBfWzaJ+N322DewNi/DlhP85wO2nbchlr/H7AYd3vOl6IJW8a/z?=
 =?us-ascii?Q?FLt1Mft19Wuj6FxtEk7NsefUEUc4HyD36q4VZIU+wjphyjwteKdpuxqc/zzz?=
 =?us-ascii?Q?KCHS4YFqnISkFsmijbSpWK7RsMpnOZqHRVfuQ8tIUaXU3Pyh1fS8lxff/Hyv?=
 =?us-ascii?Q?JDnPEA/KPBfOimyGV0kdwcQQhRhcMsVQzBkLGOqhv1L9BYyr75tnW6HNtXsg?=
 =?us-ascii?Q?WmOG6hjCpMGyZyg99zVmN+U0cXIZcW8ohuRy7QdRIuec9rfjiG7bwnjMuZO/?=
 =?us-ascii?Q?rI/CN7PF9kfyVtiV6+B9OS51QWTgRYXYlS1Gs5SXZe1B1oJv9jz0oVFMrhN3?=
 =?us-ascii?Q?bt1PRu3ph7Am4DFGweJv8jsgKcOw+K5tJMvPJokr/8yD0yXwqD2IJkSEwwnF?=
 =?us-ascii?Q?unzNXeFR2tTSmQs4Cn3aMNrCp0haqL8rljCrn8CtIA4GzE5hHrgBr3edYf+L?=
 =?us-ascii?Q?qc0v5RRYQjW8Igze6PD87xQWDzmM0CzBhP81easVSjN3ibuJY0AGRS+WqcDf?=
 =?us-ascii?Q?CaMrMGQGGG6A6GrF/ydDgatVtONg8tlAAj/g+vaM5IsTGZrHQddVuhKWtiNR?=
 =?us-ascii?Q?suSJvz+72jHU66tligE6JYQfnTSOu9RRFR7rXh09efDHZJKNYCftKAx1TvfN?=
 =?us-ascii?Q?gu9QXs4w7BOhkKH/1jAZHPLV2EJKSMOCyPZ3mQ5fdcumTIenTUFKBvMERLcf?=
 =?us-ascii?Q?+Zv9wBWo81SP1uxfX9yW2T4CYoZkuuQOP1JGbSF7YHnm/f7gWptxcNDSwijS?=
 =?us-ascii?Q?TUhKmLpOEmHLYW6nDT3tygYArYAVoq8b6Q9SBkGJAREfS6t44a9mctUmj6IY?=
 =?us-ascii?Q?wypDhWkt6J9nV3CrzTEDn4oo13J/vA0SL/iwCV6EGZyawQcdui4rrBrgIhUC?=
 =?us-ascii?Q?bGz89AoNpVC5EbE255dn1NSedsZnsfi/NDc1N7H07Y7U6ykoAl7wNYc4EAfk?=
 =?us-ascii?Q?I1reylxB+8wgPoAllD/U1D2ZthARpeXdDHiXe2F5gY+FDXBaUH5FbKBNHt/7?=
 =?us-ascii?Q?+0n6Zh0DypERtHWAx0qqWK2zXbFzkA9PitKXamGIXhgESaRsDBRuaTkhW3LG?=
 =?us-ascii?Q?7zfcYhzcRum7oxW8w/EzO9G+OSvOnGG/S/bTt1pJ5FYtpEajRVcloLmPL1F/?=
 =?us-ascii?Q?WgFR3L9Gf7P11JrNGvxfoo/EQDJiroVP8CqN7vRPwBhgCE7LQY/Z62YPcpJs?=
 =?us-ascii?Q?G6vk8TnW5TmEZXJfDOyaYKkKWkdCXKFMbJGNhGs3FXNWf/ipFa8nYwV41kfj?=
 =?us-ascii?Q?4NBYsc8G0naB4e6NAlX3HwKJQ7/IqicPYaf75Tf9zy2Lzg6kQVsg9wSYjAUB?=
 =?us-ascii?Q?/KGWdvxb720IBNwTftq+KsHd6kPHmA5fGYMLRHBPU95wlwsBuAwQQvzBjZJD?=
 =?us-ascii?Q?qiLWUFpCVeByC8GS7zFdepAJgUjvbcp4yxEfmWW0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f112fc51-fc0d-49b8-486e-08dadd049016
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 12:21:29.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ohkn4ewcq6dX1gdbqsDu514LRqoPO4Jay4R4fFx0RdO94dL/w7lb+8lvdpKswE6GO/hP5n7Za26IgMj2Bsk5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5245
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, >>> Again,
 w'd better to consider this functionality
 only when DEBUG_FS >>> is enabled. >> >> BTW, why can't we use iostat to
 get the discard latencies? > > Agreed. Let me spend some time on this. So,
 I guess this patch can't catch up with the merge window. And I still have
 some patches that have not been picked, can you take a look, hope they can
 catch up with t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.100 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.100 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1p54Hy-00Fkiz-Ow
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for counting time of
 submit discard cmd
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

Hi Jaegeuk,

>>> Again, w'd better to consider this functionality only when DEBUG_FS 
>>> is enabled.
>> 
>> BTW, why can't we use iostat to get the discard latencies?
> 
> Agreed.

Let me spend some time on this. So, I guess this patch can't catch up with the merge window.
And I still have some patches that have not been picked, can you take a look, hope they can
catch up with the window.

How long is the 6.2 merge window left and when will you send the f2fs 6.2 pull request?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
